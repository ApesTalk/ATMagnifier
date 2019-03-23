//
//  ATMagnifier.m
//  ATMagnifier
//
//  Created by ApesTalk on 2019/3/20.
//  Copyright © 2019年 https://github.com/ApesTalk. All rights reserved.
//

#import "ATMagnifier.h"

@interface ATMagnifier ()
@property (nonatomic, strong) UIImage *snapImage;
@property (nonatomic, strong, readwrite) UIView *contentView;
@property (nonatomic, strong, readwrite) UIImageView *imageView;
@end

@implementation ATMagnifier
+ (instancetype)magnifier{
    ATMagnifier *magnifier = [[ATMagnifier alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    magnifier.layer.cornerRadius = 50;
    magnifier.layer.borderColor = [[UIColor blackColor]colorWithAlphaComponent:0.3].CGColor;
    magnifier.layer.borderWidth = 1;
    magnifier.layer.shadowColor = [UIColor blackColor].CGColor;
    magnifier.layer.shadowRadius = 2;
    magnifier.layer.shadowOpacity = 0.3;
    magnifier.layer.shadowOffset = CGSizeMake(0, 2);
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    contentView.layer.cornerRadius = 50;
    contentView.layer.masksToBounds = YES;
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    iv.contentMode = UIViewContentModeScaleAspectFill;
    [contentView addSubview:iv];
    [magnifier addSubview:contentView];
    magnifier.contentView = contentView;
    magnifier.imageView = iv;
    
    magnifier.magnification = 1.5;
    return magnifier;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    self.contentView.layer.cornerRadius = self.layer.cornerRadius;
    self.imageView.frame = self.bounds;
}

- (void)setContainerView:(UIView *)containerView{
    _containerView = containerView;
    if(_containerView){
        UIGraphicsBeginImageContextWithOptions(_containerView.bounds.size, _containerView.opaque, [[UIScreen mainScreen] scale]);
        [_containerView.layer renderInContext:UIGraphicsGetCurrentContext()];
        self.snapImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }else{
        self.snapImage = nil;
    }
}

- (void)setMagnification:(CGFloat)magnification{
    _magnification = MAX(1.0, magnification);
}

- (UIImage *)at_cropImageInRect:(CGRect)rect{
    if(!_snapImage){
        return nil;
    }
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x = rect.origin.x*scale, y = rect.origin.y*scale, w = rect.size.width*scale, h = rect.size.height*scale;
    CGRect newRect = CGRectMake(x, y, w, h);
    CGImageRef sourceImageRef = [_snapImage CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, newRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:scale orientation:UIImageOrientationUp];
    return newImage;
}

- (void)updateWithPoint:(CGPoint)point{
    CGFloat width = self.bounds.size.width/self.magnification;
    CGFloat height = self.bounds.size.height/self.magnification;
    CGRect rect = CGRectMake(MIN(_containerView.bounds.size.width-width, MAX(0, point.x-width*0.5)), MIN(_containerView.bounds.size.height-height, MAX(0, point.y-height*0.5)), width, height);
    self.imageView.image = [self at_cropImageInRect:rect];

    self.center = CGPointMake(point.x, point.y-self.bounds.size.height*0.5);
}
@end
