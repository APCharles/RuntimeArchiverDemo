//
//  APStudent.m
//  runTime实现自动归档解档
//
//  Created by 安鹏 on 16/5/31.
//  Copyright © 2016年 安鹏. All rights reserved.
//

#import "APStudent.h"

@implementation APStudent

    //不需要解档归档属性数组
- (NSArray *)ignoredNames{
    
    //变量名要加下划线，runtime取出成员变量的时候，是加了_，因为本身property就意味着进行getter或者setter的方法的时候属性名是以下划线开头的。
    return @[@"_age"];
}


@end
