//
//  APBaseModel.h
//  利用runTime实现自动解档归档
//
//  Created by 安鹏 on 16/5/31.
//  Copyright © 2016年 安鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APBaseModel : NSObject

    // 设置不需要归解档的属性
- (NSArray *)ignoredNames;

@end
