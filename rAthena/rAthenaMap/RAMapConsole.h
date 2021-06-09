//
//  RAMapConsole.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/6/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAMapConsole : NSObject

@property (nonatomic, copy) void (^writeHandler)(NSString *text);

- (void)write:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
