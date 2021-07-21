//
//  ResourceManager.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "ResourceManager.h"
#import <sqlite3.h>

@implementation ResourceManager

+ (ResourceManager *)sharedManager {
    static ResourceManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ResourceManager alloc] init];
    });
    return sharedManager;
}

- (void)copyBundleResourcesAndChangeDirectory {
    NSURL *src = [[NSBundle bundleForClass:[ResourceManager class]] bundleURL];
    NSURL *dst = [[[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil] URLByAppendingPathComponent:@"rathena"];

    [[NSFileManager defaultManager] createDirectoryAtURL:dst withIntermediateDirectories:YES attributes:nil error:nil];

    NSURL *srcDB = [src URLByAppendingPathComponent:@"ragnarok.sqlite3"];
    NSURL *dstDB = [dst URLByAppendingPathComponent:@"ragnarok.sqlite3"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dstDB.path]) {
        [[NSFileManager defaultManager] copyItemAtURL:srcDB toURL:dstDB error:nil];
    }

    NSArray<NSString *> *paths = @[@"conf", @"db", @"npc"];
    for (NSString *path in paths) {
        NSURL *srcURL = [src URLByAppendingPathComponent:path];
        NSURL *dstURL = [dst URLByAppendingPathComponent:path];
        [[NSFileManager defaultManager] removeItemAtURL:dstURL error:nil];
        [[NSFileManager defaultManager] copyItemAtURL:srcURL toURL:dstURL error:nil];
    }

    [[NSFileManager defaultManager] moveItemAtURL:[dst URLByAppendingPathComponent:@"conf/import-tmpl"] toURL:[dst URLByAppendingPathComponent:@"conf/import"] error:nil];

    [[NSFileManager defaultManager] changeCurrentDirectoryPath:dst.path];

    [self upgradeDatabaseAtURL:dstDB];
}

- (void)upgradeDatabaseAtURL:(NSURL *)url {
    sqlite3 *db = nil;
    sqlite3_open(url.path.UTF8String, &db);

    NSURL *upgradeFilesDirectory = [[[NSBundle bundleForClass:[ResourceManager class]] bundleURL] URLByAppendingPathComponent:@"sql-files/upgrades"];
    NSArray<NSURL *> *upgradeFiles = [[[NSFileManager defaultManager] contentsOfDirectoryAtURL:upgradeFilesDirectory includingPropertiesForKeys:nil options:0 error:nil] sortedArrayUsingComparator:^NSComparisonResult(NSURL *url1, NSURL *url2) {
        return [url1.path compare:url2.path];
    }];

    for (NSURL *upgradeFile in upgradeFiles) {
        NSString *upgradeID = upgradeFile.lastPathComponent.stringByDeletingPathExtension;

        if (![upgradeID hasPrefix:@"upgrade_"]) {
            continue;
        }

        NSString *sql = [NSString stringWithFormat:@"SELECT count(*) FROM upgrades WHERE id = '%@' LIMIT 1", upgradeID];
        sqlite3_stmt *stmt = nil;
        sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
        sqlite3_step(stmt);
        int count = sqlite3_column_int(stmt, 0);
        sqlite3_finalize(stmt);
        stmt = nil;

        if (count == 1) {
            continue;
        }

        sql = [[NSString alloc] initWithContentsOfURL:upgradeFile encoding:NSUTF8StringEncoding error:nil];
        sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        stmt = nil;

        sql = [NSString stringWithFormat:@"INSERT INTO upgrades VALUES ('%@')", upgradeID];
        sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        stmt = nil;
    }

    sqlite3_close(db);
}

@end