//
//  UIView+ATMagnifier.h
//  ATMagnifier
//
//  Created by ApesTalk on 2019/3/20.
//  Copyright © 2019年 https://github.com/ApesTalk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATMagnifier.h"

@interface UIView (ATMagnifier) 
- (void)at_showMagnifier:(void (^)(ATMagnifier *magnifier))config;
@end
