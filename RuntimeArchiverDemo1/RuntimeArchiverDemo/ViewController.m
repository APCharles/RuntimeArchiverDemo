    //
    //  ViewController.m
    //  runTime实现自动归档解档
    //
    //  Created by 安鹏 on 16/5/31.
    //  Copyright © 2016年 安鹏. All rights reserved.
    //

#import "ViewController.h"
#import "APStudent.h"
@interface ViewController ()

/** 归档的数据 */
@property(strong,nonatomic)NSData *stuData;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    APStudent *stu = [[APStudent alloc] init];
    stu.age = @"24";
    stu.name = @"Charles";
    stu.sex = @"boy";
    
        //将模型归档
    self.stuData = [NSKeyedArchiver archivedDataWithRootObject:stu];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
        //接档数据
    APStudent *stu = [NSKeyedUnarchiver unarchiveObjectWithData:self.stuData];
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"学生信息" message:stu.name delegate:self cancelButtonTitle:stu.sex otherButtonTitles:stu.age, nil];
    
    [alertView show];
}

@end
