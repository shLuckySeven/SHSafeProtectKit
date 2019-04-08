//
//  SHSafeProtectorDefine.h
// https://github.com/SHmakethebest/SHSafeProtector
//
//  Created by shuhuan on 2018/9/18.
//

#ifndef SHSafeProtectorDefine_h
#define SHSafeProtectorDefine_h
@class SHSafeProtector;

#define  SHSafeLog(fmt, ...)  NSLog(fmt, ##__VA_ARGS__)
#define  SHSafeProtectionCrashLog(exception,crash)   [SHSafeProtector safe_logCrashWithException:exception crashType:crash]

//NSNotificationCenter 即使设置LogTypeAll 也不会打印，
//iOS9之后系统已经优化了，即使不移除也不会崩溃， 所以仅iOS8系统会出现此类型carsh,但是有的类是在dealloc里移除通知，而我们是在所有类的dealloc方法之前检测是否移除，没移除则去移除所以会误报crash，干脆直接不报此类型crash了

typedef enum : NSUInteger {
    SHSafeProtectorLogTypeNone,//所有log都不打印
    SHSafeProtectorLogTypeAll,//打印所有log
} SHSafeProtectorLogType;

//哪个类型的crash
typedef enum : NSUInteger {
    SHSafeProtectorCrashTypeSelector,
    SHSafeProtectorCrashTypeKVO,
    SHSafeProtectorCrashTypeNSArray,
    SHSafeProtectorCrashTypeNSMutableArray,
    SHSafeProtectorCrashTypeNSDictionary,
    SHSafeProtectorCrashTypeNSMutableDictionary,
    SHSafeProtectorCrashTypeNSStirng,
    SHSafeProtectorCrashTypeNSMutableString,
    SHSafeProtectorCrashTypeNSAttributedString,
    SHSafeProtectorCrashTypeNSMutableAttributedString,
    SHSafeProtectorCrashTypeNSNotificationCenter,
    SHSafeProtectorCrashTypeNSUserDefaults,
    SHSafeProtectorCrashTypeNSCache,
    SHSafeProtectorCrashTypeNSSet,
    SHSafeProtectorCrashTypeNSMutableSet,
    SHSafeProtectorCrashTypeNSData,
    SHSafeProtectorCrashTypeNSMutableData,
    SHSafeProtectorCrashTypeNSOrderedSet,
    SHSafeProtectorCrashTypeNSMutableOrderedSet,
    
} SHSafeProtectorCrashType;



typedef void(^SHSafeProtectorBlock)(NSException *exception,SHSafeProtectorCrashType crashType);


#endif /* SHSafeProtectorDefine_h */
