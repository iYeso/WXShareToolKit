//
//  NSObject+Runtime.h
//  WXCategory
//
//  Created by Yeso on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Runtime)

/// 打印协议列表
/// @param cls 类对象
+ (void)printClassProtocolListWithClass:(Class)cls;

/// 类的方法列表打印
/// @param cls 类对象
+ (void)printClassMethodListWithClass:(Class)cls;

/// 打印成员变量列表
/// @param cls 类对象
+ (void)printClassIvarsWithClass:(Class)cls;

/// 打印类的属性列表
/// @param cls 类对象
+ (void)printClassPropertyWithClass:(Class)cls;


@end

NS_ASSUME_NONNULL_END
