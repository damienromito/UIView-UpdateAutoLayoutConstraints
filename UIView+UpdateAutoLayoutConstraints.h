//
//  UIView+UpdateAutoLayoutConstant.h
//  ConstraintsCodeDemo
//
//  Created by Damien Romito on 13/03/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UpdateAutoLayoutConstraints)
- (BOOL) setConstraintConstant:(CGFloat)constant forAttribute:(NSLayoutAttribute)attribute;

@end
