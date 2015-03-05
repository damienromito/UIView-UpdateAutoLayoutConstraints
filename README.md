UIView-UpdateAutoLayoutConstraints
==================================

An easy way to create and update AutoLayout Constraints (Mainly to update Width and Height of UIView)


![alt text](https://github.com/damienromito/UIView-UpdateAutoLayoutConstraints/blob/master/picture.jpg "Resize tableViewHeader")


**1 - import Category**

```objective-c 
#import "UIView+UpdateAutoLayoutConstraints.h"
```

**2 - create your UIViews**
```objective-c 
UIView *myView1 = [[UIView alloc]init];
one.backgroundColor = [UIColor redColor];
one.translatesAutoresizingMaskIntoConstraints = NO;  //<<-- Don't forget this line to enable AutoLayout
[self.view addSubview:one];

UIView *myView2 = [[UIView alloc]init];
two.backgroundColor = [UIColor blueColor];
two.translatesAutoresizingMaskIntoConstraints = NO;
[self.view addSubview:two];
```
    
**3 - create initial constraints**
```objective-c 
NSDictionary *metrics = @{@"height":@50.0};
NSDictionary *views = NSDictionaryOfVariableBindings(myView1,myView2);

[self.view addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"|-[one]-|"
                           options: 0
                           metrics:metrics
                           views:views]];

[self.view addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"V:|-[myView1(50)][myView2]]"
                                 options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight
                                 metrics:metrics
                                 views:views]];
                                     
```       
**4 - Whenever you want, Update this constraint**
```objective-c
//Hide View
[myView1 setConstraintConstant:0 forAttribute:NSLayoutAttributeHeight];

//if constraint doesn't exist, it will be created
[myView1 setConstraintConstant:20 forAttribute:NSLayoutAttributeWidth];

//you can use tools to hide/show a uiview
[myView1 hideByHeight:YES];

//then
[myView1 hideByHeight:NO];
```


    
