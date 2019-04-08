//
//  NSMutableData+Safe.h
//  SHSafeProtector
// https://github.com/shLuckySeven/SHSafeProtectKit.git
//
//  Created by shuhuan on 2018/9/13.
//

#import <Foundation/Foundation.h>


/*
可防止以下crash
 1.subdataWithRange:
 2.rangeOfData:options:range:
 3.resetBytesInRange:
 4.replaceBytesInRange:withBytes:
 5.replaceBytesInRange:withBytes:length:
 
 */

@interface NSMutableData (Safe)

@end
