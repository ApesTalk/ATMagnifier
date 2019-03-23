//
//  UIView+ATMagnifier.m
//  ATMagnifier
//
//  Created by ApesTalk on 2019/3/20.
//  Copyright © 2019年 https://github.com/ApesTalk. All rights reserved.
//

#import "UIView+ATMagnifier.h"

@implementation UIView (ATMagnifier)

- (ATMagnifier *)at_magnifier{
    static ATMagnifier *magnifier = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        magnifier = [ATMagnifier magnifier];
        magnifier.containerView = self;
    });
    return magnifier;
}

- (void)at_showMagnifier:(void (^)(ATMagnifier *magnifier))config{
    ATMagnifier *m = [self at_magnifier];
    if(config){
        config(m);
    }
    
    [self at_magnifier].containerView = self;
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(at_handleLongGestureAction:)];
    [self addGestureRecognizer:gesture];
}

- (void)at_handleLongGestureAction:(UILongPressGestureRecognizer *)gesture{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            CGPoint point = [gesture locationInView:self];
            [[self at_magnifier]updateWithPoint:point];
            [self addSubview:[self at_magnifier]];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            CGPoint point = [gesture locationInView:self];
            [[self at_magnifier]updateWithPoint:point];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
            [[self at_magnifier]removeFromSuperview];
            break;
        }
        default:
            break;
    }
}

@end
