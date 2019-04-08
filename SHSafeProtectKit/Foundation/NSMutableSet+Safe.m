
//
//  NSMutableSet+Safe.m
//  SHSafeProtector
// https://github.com/shLuckySeven/SHSafeProtectKit.git
//
//  Created by shuhuan on 2018/9/13.
//

#import "NSMutableSet+Safe.h"
#import "NSObject+SafeSwizzle.h"
#import "SHSafeProtector.h"

@implementation NSMutableSet (Safe)
+(void)openSafeProtector
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dClass=NSClassFromString(@"__NSSetM");
        [self safe_exchangeInstanceMethod:dClass originalSel:@selector(addObject:) newSel:@selector(safe_addObject:)];
        [self safe_exchangeInstanceMethod:dClass originalSel:@selector(removeObject:) newSel:@selector(safe_removeObject:)];
    });
}
- (void)safe_addObject:(id)object
{
    @try {
        [self safe_addObject:object];
    }
    @catch (NSException *exception) {
        SHSafeProtectionCrashLog(exception,SHSafeProtectorCrashTypeNSMutableSet);
    }
    @finally {
    }
}
- (void)safe_removeObject:(id)object
{
    @try {
        [self safe_removeObject:object];
    }
    @catch (NSException *exception) {
        SHSafeProtectionCrashLog(exception,SHSafeProtectorCrashTypeNSMutableSet);
    }
    @finally {
    }
}

@end
