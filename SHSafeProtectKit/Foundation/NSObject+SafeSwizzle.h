//
//  NSObject+SafeSwizzle.h
//  SHSafeProtector
// https://github.com/shLuckySeven/SHSafeProtectKit.git
//
//  Created by shuhuan on 2018/9/18.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (SafeSwizzle)

//交换类方法
+ (void)safe_exchangeClassMethod:(Class)dClass    originalSel:(SEL)originalSelector newSel:(SEL)newSelector;

//交换对象方法
+ (void)safe_exchangeInstanceMethod:(Class)dClass originalSel:(SEL)originalSelector newSel: (SEL)newSelector;

@end
