//
//  RACharServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "RACharServer.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    RACharServer *charServer = RACharServer.sharedServer;

    if (charServer.outputHandler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        charServer.outputHandler(data);
    }

    return 0;
}

void do_recv(int fd) {
    RACharServer *charServer = RACharServer.sharedServer;

    if (charServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        charServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    RACharServer *charServer = RACharServer.sharedServer;

    if (charServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        charServer.dataSendHandler(data);
    }
}

@interface RACharServer ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation RACharServer

+ (RACharServer *)sharedServer {
    static RACharServer *sharedServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServer = [[RACharServer alloc] init];
    });
    return sharedServer;
}

- (NSString *)name {
    return @"Char Server";
}

- (void)start {
    if (self.thread == nil) {
        self.thread = [[NSThread alloc] initWithBlock:^{
            FILE *output = fwopen(0, write_function);
            STDOUT = output;
            STDERR = output;

            recv_callback = do_recv;
            send_callback = do_send;

            char arg0[] = "char-server";
            char *args[1] = {arg0};
            main(1, args);
        }];
    }

    if (self.thread.isExecuting) {
        return;
    }

    [self.thread start];
}

- (void)stop {
    if (self.thread == nil) {
        return;
    }

    if (!self.thread.isExecuting) {
        return;
    }

    global_core->signal_shutdown();

    tfl_root = NULL;

    self.thread = nil;
}

@end
