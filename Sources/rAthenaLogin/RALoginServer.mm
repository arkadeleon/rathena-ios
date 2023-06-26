//
//  RALoginServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "RALoginServer.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    RALoginServer *loginServer = RALoginServer.sharedServer;

    if (loginServer.outputHandler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        loginServer.outputHandler(data);
    }

    return 0;
}

void do_recv(int fd) {
    RALoginServer *loginServer = RALoginServer.sharedServer;

    if (loginServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        loginServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    RALoginServer *loginServer = RALoginServer.sharedServer;

    if (loginServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        loginServer.dataSendHandler(data);
    }
}

@interface RALoginServer ()

@property (nonatomic) NSThread *thread;

@end

@implementation RALoginServer

+ (RALoginServer *)sharedServer {
    static RALoginServer *sharedServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServer = [[RALoginServer alloc] init];
    });
    return sharedServer;
}

- (NSString *)name {
    return @"Login Server";
}

- (RAServerStatus)status {
    if (global_core == NULL) {
        return RAServerStatusNotStarted;
    }

    switch (global_core->get_status()) {
        case rathena::server_core::e_core_status::NOT_STARTED:
            return RAServerStatusNotStarted;
        case rathena::server_core::e_core_status::CORE_INITIALIZING:
        case rathena::server_core::e_core_status::CORE_INITIALIZED:
        case rathena::server_core::e_core_status::SERVER_INITIALIZING:
        case rathena::server_core::e_core_status::SERVER_INITIALIZED:
            return RAServerStatusStarting;
        case rathena::server_core::e_core_status::RUNNING:
            return RAServerStatusRunning;
        case rathena::server_core::e_core_status::STOPPING:
        case rathena::server_core::e_core_status::SERVER_FINALIZING:
        case rathena::server_core::e_core_status::SERVER_FINALIZED:
        case rathena::server_core::e_core_status::CORE_FINALIZING:
        case rathena::server_core::e_core_status::CORE_FINALIZED:
            return RAServerStatusStopping;
        case rathena::server_core::e_core_status::STOPPED:
            return RAServerStatusStopped;
    }
}

- (void)startWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.thread == nil) {
            self.thread = [[NSThread alloc] initWithBlock:^{
                FILE *output = fwopen(0, write_function);
                STDOUT = output;
                STDERR = output;

                recv_callback = do_recv;
                send_callback = do_send;

                char arg0[] = "login-server";
                char *args[1] = {arg0};
                main(1, args);
            }];
        }

        if (self.thread.isExecuting) {
            completionHandler(NO);
            return;
        }

        [self.thread start];

        while (self.status != RAServerStatusRunning) {
        }

        completionHandler(YES);
    });
}

- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.thread == nil) {
            completionHandler(NO);
            return;
        }

        if (!self.thread.isExecuting) {
            completionHandler(NO);
            return;
        }

        global_core->signal_shutdown();

        tfl_root = NULL;

        self.thread = nil;

        while (self.status != RAServerStatusStopped) {
        }

        completionHandler(YES);
    });
}

@end
