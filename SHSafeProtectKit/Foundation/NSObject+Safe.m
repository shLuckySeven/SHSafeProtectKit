//
//  NSObject+Safe.m
// https://github.com/shLuckySeven/SHSafeProtectKit.git
//
//  Created by shuhuan on 2018/4/20.
//  Copyright © 2018年 shuhuan. All rights reserved.

#import "NSObject+Safe.h"
#import "NSObject+SafeSwizzle.h"
#import "SHSafeProtector.h"

@interface SHSafeProxy:NSObject
@property (nonatomic,strong) NSException *exception;
@property (nonatomic,weak) id safe_object;
@end
@implementation SHSafeProxy
-(void)safe_crashLog{
}
@end


@implementation NSObject (Safe)

+(void)openSafeProtector
{
     if ([NSStringFromClass([NSObject class]) isEqualToString:@"NSObject"]) {
         static dispatch_once_t onceToken;
         dispatch_once(&onceToken, ^{
             
             [self safe_exchangeInstanceMethod:[self class] originalSel:@selector(methodSignatureForSelector:) newSel:@selector(safe_methodSignatureForSelector:)];
             
               [self safe_exchangeInstanceMethod:[self class] originalSel:@selector(forwardInvocation:) newSel:@selector(safe_forwardInvocation:)];
         });
     }else{
         //只有NSObject 能调用openSafeProtector其他类调用没效果
     }
}
- (NSMethodSignature *)safe_methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *ms = [self safe_methodSignatureForSelector:aSelector];
    if ([self respondsToSelector:aSelector] || ms){
        return ms;
    }
    else{
        return [SHSafeProxy instanceMethodSignatureForSelector:@selector(safe_crashLog)];
    }
}

- (void)safe_forwardInvocation:(NSInvocation *)anInvocation{
    @try {
        [self safe_forwardInvocation:anInvocation];
        
    } @catch (NSException *exception) {
        SHSafeProtectionCrashLog(exception,SHSafeProtectorCrashTypeSelector);
    } @finally {
    }
}


@end
