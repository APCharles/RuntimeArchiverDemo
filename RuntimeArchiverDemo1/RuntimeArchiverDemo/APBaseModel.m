//
//  APBaseModel.m
//  利用runTime实现自动解档归档
//
//  Created by 安鹏 on 16/5/31.
//  Copyright © 2016年 安鹏. All rights reserved.
//

#import "APBaseModel.h"
#import <objc/runtime.h>
@implementation APBaseModel
/**
 *  归档
 *
 *需要取出哪些属性
 */
-(void)encodeWithCoder:(NSCoder *)encoder{
    
    unsigned int count;
        //获得所有成员变量
    Ivar *ivar = class_copyIvarList([self class], &count);
    
    for (int i=0; i<count; i++) {
        
        Ivar iv = ivar[i];
        
        const char *name = ivar_getName(iv);
        
            // 将每个成员变量名转换为NSString对象类型
        NSString *key = [NSString stringWithUTF8String:name];
        
            // 如果有实现该方法再去调用
        if ([self respondsToSelector:@selector(ignoredNames)]) {
            if ([[self ignoredNames] containsObject:key])
                continue;
        }
        
            //利用KVC取值
        id value = [self valueForKey:key];
            //进行归档
        [encoder encodeObject:value forKey:key];
        
            //这两步就相当于 [encoder encodeObject:@(self.age) forKey:@"age"];
    }
    
    free(ivar);
}

/**    解档 需要取出什么属性   */
-(id)initWithCoder:(NSCoder *)decoder{
    
    self  = [super init];
    
    if (self) {
        
        unsigned int count = 0;
            //获取类中所有成员变量名
        Ivar *ivar = class_copyIvarList([self class], &count);
        for (int i = 0; i<count; i++) {
            
            Ivar iva = ivar[i];
            
            const char *name = ivar_getName(iva);
            
            
            NSString *key = [NSString stringWithUTF8String:name];
            
                // 如果有实现该方法再去调用
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) continue;
            }
            
                //根据变量名进行解档取值
            id value = [decoder decodeObjectForKey:key];
            
                //利用KVC对属性赋值
            [self setValue:value forKey:key];
            
                // 这两步就相当于以前的 self.age = [decoder decodeObjectForKey:@"age"];
        }
        
        free(ivar);
    }
    
    return self;
}
@end
