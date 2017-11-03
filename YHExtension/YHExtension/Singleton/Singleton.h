/*
专门用来保存单例代码
 最后一行不要加 \ 
 
 使用步骤：
 1.在.h中加入#import "Singleton.h"
 2.在.h的@interface 里面写singleton_interface(类名)
 3.在.m的@implementation 里面写singleton_implementation(类名)
*/

// @interface
#define singleton_interface(className) \
+ (className *)shared##className;


// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
+ (className *)shared##className \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
}


//#define singleton_interface(className) \
//+ (className * _Nonnull)shared##className;
//
//
//// @implementation
//#define singleton_implementation(className) \
//static className *_instance; \
//+ (id _Nonnull)allocWithZone:(NSZone *)zone \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [super allocWithZone:zone]; \
//}); \
//return _instance; \
//} \
//+ (className * _Nonnull)shared##className \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [[self alloc] init]; \
//}); \
//return _instance; \
//}
