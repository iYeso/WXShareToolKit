//
//  NSObject+Runtime.m
//  WXCategory
//
//  Created by Yeso on 2021/3/1.
//

#import "NSObject+Runtime.h"

@implementation NSObject (Runtime)

+ (void)printClassProtocolListWithClass:(Class)cls {
    NSLog(@"%@的协议列表:", NSStringFromClass(cls));
    NSLog(@"---------\n");
    
    unsigned int outCount = 0;
    
    Protocol * __unsafe_unretained _Nonnull * _Nullable protocolList =  class_copyProtocolList(cls, &outCount);
    
    for (NSInteger i = 0; i < outCount; i++) {
        
        NSString *str = [NSString stringWithCString:protocol_getName(protocolList[i]) encoding:(NSUTF8StringEncoding)];
        NSLog(@"%@", str);
    }
    
    NSLog(@"---------\n");
}

/// 类的方法列表打印
+ (void)printClassMethodListWithClass:(Class)cls {
    
    NSLog(@"%@的方法列表:", NSStringFromClass(cls));
    NSLog(@"---------\n");
    
    unsigned int outCount = 0;
    Method *methodList = class_copyMethodList(cls, &outCount);
    
    for (NSInteger i = 0; i < outCount; i++) {
        
        /// 获取方法的sel
        SEL sel = method_getName(methodList[i]);
        /// 使用sel的getName方法获取(char *)描述
        NSString *str = [NSString stringWithCString:sel_getName(sel) encoding:(NSUTF8StringEncoding)];
        NSLog(@"%@", str);
    }
    
    NSLog(@"---------\n");
    
}

/// 打印成员变量列表
+ (void)printClassIvarsWithClass:(Class)cls {
    
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList(cls, &outCount);
    NSLog(@"%@的成员变量列表:", NSStringFromClass(cls));
    NSLog(@"---------\n");
    for (NSInteger i = 0; i<outCount; i++) {
        NSString *str = [NSString stringWithCString:ivar_getName(ivarList[i]) encoding:(NSUTF8StringEncoding)];
        NSLog(@"%@", str);
    }
    NSLog(@"---------\n");
}

/// 打印类的属性列表
+ (void)printClassPropertyWithClass:(Class)cls {
    
    unsigned int outCount = 0;
    
    NSLog(@"%@的属性列表:", NSStringFromClass(cls));
    NSLog(@"---------\n");
    
    objc_property_t *property = class_copyPropertyList(cls, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        NSString *str = [NSString stringWithCString:property_getName(property[i])
                                           encoding:(NSUTF8StringEncoding)];
        NSLog(@"%@", str);
    }
    NSLog(@"---------\n");
}

@end
