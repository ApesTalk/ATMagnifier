//
//  ViewController.m
//  ATMagnifier
//
//  Created by ApesTalk on 2019/3/20.
//  Copyright © 2019年 https://github.com/ApesTalk. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ATMagnifier.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"ATMagnifier";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width-20, self.view.bounds.size.height-100)];
    label.font = [UIFont systemFontOfSize:15];
//    label.textColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    label.text = @"这是一个简单的放大镜🔎效果，使用简单方便，无代码侵入。如果你喜欢，请不吝给个star✨，谢谢！\n\n"
    "使用示例：\n\n"
    "1.直接使用默认样式：[self.view at_showMagnifier:nil]\n\n"
    "2.自定义样式：\n\n"
    "[self.view at_showMagnifier:^(ATMagnifier *magnifier) {\n"
    "   magnifier.frame = CGRectMake(0, 0, 120, 120);\n"
    "   magnifier.layer.cornerRadius = 60;\n"
    "   magnifier.layer.borderColor = [[UIColor blackColor]colorWithAlphaComponent:0.1].CGColor;\n"
    "   magnifier.layer.borderWidth = 0.6;\n"
    "   magnifier.layer.shadowColor = [UIColor redColor].CGColor;\n"
    "   magnifier.layer.shadowRadius = 1;\n"
    "   magnifier.layer.shadowOpacity = 0.1;\n"
    "   magnifier.layer.shadowOffset = CGSizeMake(0, 1);\n"
    "   \n\n"
    "   magnifier.magnification = 2.0;\n"
    "}];\n\n";
    [self.view addSubview:label];
    
    //1.直接使用默认样式
    [self.view at_showMagnifier:nil];
    
    //2.自定义样式
//    [self.view at_showMagnifier:^(ATMagnifier *magnifier) {
//        magnifier.frame = CGRectMake(0, 0, 120, 120);
//        magnifier.layer.cornerRadius = 60;
//        magnifier.layer.borderColor = [[UIColor blackColor]colorWithAlphaComponent:0.1].CGColor;
//        magnifier.layer.borderWidth = 0.6;
//        magnifier.layer.shadowColor = [UIColor redColor].CGColor;
//        magnifier.layer.shadowRadius = 1;
//        magnifier.layer.shadowOpacity = 0.1;
//        magnifier.layer.shadowOffset = CGSizeMake(0, 1);
//        
//        magnifier.magnification = 2.0;
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
