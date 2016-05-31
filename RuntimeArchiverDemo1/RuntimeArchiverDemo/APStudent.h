//
//  APStudent.h
//  runTime实现自动归档解档
//
//  Created by 安鹏 on 16/5/31.
//  Copyright © 2016年 安鹏. All rights reserved.
//

#import "APBaseModel.h"

@interface APStudent : APBaseModel

/** 姓名 */
@property(strong,nonatomic)NSString *name;

/** 年龄 */ // 不需要解档归档
@property(strong,nonatomic)NSString *age;

/** 性别 */
@property(strong,nonatomic)NSString *sex;

@end
