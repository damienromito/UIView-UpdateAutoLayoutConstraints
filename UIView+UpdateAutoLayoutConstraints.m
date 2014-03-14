//
//  UIView+UpdateAutoLayoutConstant.m
//  ConstraintsCodeDemo
//
//  Created by Damien Romito on 13/03/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import "UIView+UpdateAutoLayoutConstraints.h"

@implementation UIView (UpdateAutoLayoutConstraints)

- (BOOL) setConstraintConstant:(CGFloat)constant forAttribute:(NSLayoutAttribute)attribute
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && firstItem = %@", attribute, self];
    NSArray *fillteredArray = [[self.superview constraints] filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0)
    {
        [self.superview addConstraint: [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:constant]];
        return NO;
    }else
    {
        [fillteredArray.firstObject setConstant:constant];
        return YES;
    }
}

@end
