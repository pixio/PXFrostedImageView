//
//  PXViewController.m
//  PXFrostedImageView
//
//  Created by Daniel Blakemore on 05/01/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXViewController.h"

#import <PXFrostedImageView/PXFrostedImageView.h>

@interface PXViewController ()

@end

@implementation PXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"PX Infinite Scroll View"];
    
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor orangeColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    PXFrostedImageView * imageView = [[PXFrostedImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"pixiosky"]];
    [imageView setFrostColor:[[UIColor greenColor] colorWithAlphaComponent:0.5]];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [[self view] addSubview:imageView];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(imageView);
    NSDictionary* metrics = @{@"w" : @320, @"h" : @200};
    
    // Horizontal
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[imageView(w)]" options:0 metrics:metrics views:views]];
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView(h)]" options:0 metrics:metrics views:views]];
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
