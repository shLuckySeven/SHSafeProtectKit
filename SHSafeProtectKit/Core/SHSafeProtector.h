//
//  SHSafeProtector.h
// https://github.com/shLuckySeven/SHSafeProtectKit.git

//  Created by shuhuan on 2018/8/9.
//  Copyright © 2018年 shuhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHSafeProtectorDefine.h"

@interface SHSafeProtector : NSObject
    
//打开目前所支持的所有安全保护
//isDebug=YES 代表测试环境，当捕获到crash时会利用断言闪退， 同时回调block
//isDebug=NO  代表正式环境，当捕获到crash时不会利用断言闪退，会回调block
+ (void)openSafeProtectorWithIsDebug:(BOOL)isDebug block:(SHSafeProtectorBlock)block;

+ (void)safe_logCrashWithException:(NSException *)exception crashType:(SHSafeProtectorCrashType)crashType;

@end
