# ATMagnifier

这是一个简单的放大镜🔎效果，使用简单方便，无代码侵入。采用UIView的Category实现，使用时只需引入``#import "UIView+ATMagnifier.h"``，想在哪个视图上添加放大镜效果就在哪个视图上添加。



- 如果默认样式满足你的需求，可以直接这样使用：

```OBJC
[self.view at_showMagnifier:nil];
```

- 如果默认样式不满足你的需求，你可以自定义你的效果：

```OBJC
[self.view at_showMagnifier:^(ATMagnifier *magnifier) {
    magnifier.frame = CGRectMake(0, 0, 120, 120);
    magnifier.layer.borderColor = [[UIColor blackColor]colorWithAlphaComponent:0.1].CGColor;
    magnifier.layer.borderWidth = 0.6;
    magnifier.layer.shadowColor = [UIColor redColor].CGColor;
    magnifier.layer.shadowRadius = 1;
    magnifier.layer.shadowOpacity = 0.1;
    magnifier.layer.shadowOffset = CGSizeMake(0, 1);

    magnifier.magnification = 2.0;
}];
```

效果图：
![](https://github.com/ApesTalk/ATMagnifier/blob/master/ATMagnifier/magnifier.gif)
