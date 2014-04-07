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
@property (nonatomic, strong) UILabel *hidableView;
@property (nonatomic, strong) UIView *header;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.header = [[UIView alloc] init];

    UIButton * v1 = [UIButton new];
    [v1 setTitle:@"HIDE/SHOW VIEW" forState:UIControlStateNormal];
    [v1 addTarget:self action:@selector(actionToggle) forControlEvents:UIControlEventTouchUpInside];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [self.header addSubview:v1];
    
    //VIEW WITH DYNAMIC HEIGHT
    self.hidableView = [UILabel new];
    self.hidableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.hidableView.backgroundColor = [UIColor whiteColor];
    self.hidableView.numberOfLines = 0;
    self.hidableView.preferredMaxLayoutWidth = 320; //YOU NEED TO DEFINE THE preferredMaxLayoutWidth
    self.hidableView.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sagittis adipiscing orci";
    [self.header addSubview:self.hidableView];
    
    UIView * v2 = [UIView new];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor greenColor];
    [self.header addSubview:v2];
    
    NSDictionary *views = @{@"v1" : v1,
                            @"hidableView":self.hidableView,
                            @"v2" : v2,
                            };
    
    [self.header addConstraints:[NSLayoutConstraint
                                constraintsWithVisualFormat:@"H:|-[v1]-|"
                                options: 0
                                metrics:0
                                views:views]];
    
    
    [self.header addConstraints:[NSLayoutConstraint
                                constraintsWithVisualFormat:@"V:|[v1(100)]-[hidableView]-[v2(40)]|"
                                options: NSLayoutFormatAlignAllRight | NSLayoutFormatAlignAllLeft
                                metrics:0
                                views:views]];
    
    
    
    [self resizeTableViewHeader];

    
}


- (void)resizeTableViewHeader
{
    //GET THE SIZE OF THE CONTAINER
    CGSize fittingSize = [self.header systemLayoutSizeFittingSize: UILayoutFittingCompressedSize];
    self.header.frame = CGRectMake(0, 0, 320, fittingSize.height);
    self.tableView.tableHeaderView = self.header;
}


- (void) actionToggle
{
    [self.hidableView hideByHeight:!self.hidableView.hidden];
    [self resizeTableViewHeader];
}


@end
