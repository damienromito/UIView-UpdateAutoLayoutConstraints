//
//  ViewController.m
//  TableViewHeaderAutoLayout
//
//  Created by Damien Romito on 17/03/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import "ViewController.h"
#import "UIView+UpdateAutoLayoutConstraints.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *hidableView;
@property (nonatomic, strong) UILabel *dynamicLabel;

@property (nonatomic, strong) UIView *header;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.header = [[UIView alloc] init];

    UIButton * v1 = [UIButton new];
    [v1 setTitle:@"BTN:HIDE/SHOW VIEW BELOW" forState:UIControlStateNormal];
    [v1 addTarget:self action:@selector(actionToggle) forControlEvents:UIControlEventTouchUpInside];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [self.header addSubview:v1];
    
    self.hidableView = [UIView new];
    self.hidableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.hidableView.backgroundColor = [UIColor yellowColor];
    [self.header addSubview:self.hidableView];
    
    //VIEW WITH DYNAMIC HEIGHT
    self.dynamicLabel = [UILabel new];
    self.dynamicLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.dynamicLabel.backgroundColor = [UIColor whiteColor];
    self.dynamicLabel.numberOfLines = 0;
    self.dynamicLabel.preferredMaxLayoutWidth = 320; //YOU NEED TO DEFINE THE preferredMaxLayoutWidth
    self.dynamicLabel.text = @"dzdzd ";
    [self.header addSubview:self.dynamicLabel];
    
    
    UIButton * v2 = [UIButton new];
    [v2 setTitle:@"BTN:UPDATE TEXT ABOVE" forState:UIControlStateNormal];
    [v2 addTarget:self action:@selector(actionToggleText) forControlEvents:UIControlEventTouchUpInside];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor redColor];
    [self.header addSubview:v2];
    
    NSDictionary *views = @{@"v1" : v1,
                            @"hidableView":self.hidableView,
                            @"dynamicLabel":self.dynamicLabel,
                            @"v2" : v2,
                            };
    
    [self.header addConstraints:[NSLayoutConstraint
                                constraintsWithVisualFormat:@"H:|-[v1]-|"
                                options: 0
                                metrics:0
                                views:views]];
    
    
    [self.header addConstraints:[NSLayoutConstraint
                                constraintsWithVisualFormat:@"V:|[v1(100)]-[hidableView(30)][dynamicLabel]-[v2(40)]"
                                options: NSLayoutFormatAlignAllRight | NSLayoutFormatAlignAllLeft
                                metrics:0
                                views:views]];
    
    
    
    [self resizeTableViewHeader];

    
}


- (void)resizeTableViewHeader
{
    //GET THE SIZE OF THE CONTAINER
//    CGSize fittingSize = [self.header systemLayoutSizeFittingSize: UILayoutFittingCompressedSize];
//    self.header.frame = CGRectMake(0, 0, 320, fittingSize.height);
    
    [self.header heightToFitWithBottomPadding:11];
    self.tableView.tableHeaderView = self.header;
}


- (void) actionToggle
{
    [self.hidableView hideByHeight:!self.hidableView.hidden];
    
    [self resizeTableViewHeader];
}

- (void) actionToggleText
{
    if ([self.dynamicLabel.text isEqualToString:@""]) {
        self.dynamicLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sagittis adipiscing orci";
    }else
    {
        self.dynamicLabel.text = @"";
    }
    [self resizeTableViewHeader];
   // [self resizeTableViewHeader];
}


@end
