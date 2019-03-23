//
//  ATMagnifier.h
//  ATMagnifier
//
//  Created by ApesTalk on 2019/3/20.
//  Copyright © 2019年 https://github.com/ApesTalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATMagnifier : UIView
+ (instancetype)magnifier;
@property (nonatomic, weak) UIView *containerView;
@property (nonatomic, assign) CGFloat magnification;///< defulat 1.5
@property (nonatomic, strong, readonly) UIView *contentView;///< you can config it size/border/shadow...
@property (nonatomic, strong, readonly) UIImageView *imageView;///< you can config it size...
- (void)updateWithPoint:(CGPoint)point;
@end
