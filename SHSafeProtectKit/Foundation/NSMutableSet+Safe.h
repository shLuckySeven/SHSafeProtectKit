//
//  NSMutableSet+Safe.h
//  SHSafeProtector
// https://github.com/shLuckySeven/SHSafeProtectKit.git
//
//  Created by shuhuan on 2018/9/13.
//

#import <Foundation/Foundation.h>
/*
 可避免以下crash
 1.setWithObject:
 2.(instancetype)initWithObjects:(ObjectType)firstObj
 3.setWithObjects:(ObjectType)firstObj
 4.addObject:
 5.removeObject:
 */

@interface NSMutableSet (Safe)

@end
