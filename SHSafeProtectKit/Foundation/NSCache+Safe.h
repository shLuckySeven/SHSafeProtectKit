//
//  NSCache+Safe.h
//  SHSafeProtector
// https://github.com/shLuckySeven/SHSafeProtectKit.git
//
//  Created by shuhuan on 2018/9/13.
//

#import <Foundation/Foundation.h>

/*
 可避免以下crash
 setObject:forKey:
 setObject:forKey:cost:
 
 */

@interface NSCache (Safe)

@end
