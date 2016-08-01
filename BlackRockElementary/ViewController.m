//
//  ViewController.m
//  BlackRockElementary
//
//  Created by Phil Maddaloni on 7/31/16.
//  Copyright © 2016 6kites. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (id b in _buttons) {
        
        UIButton *btn = (UIButton *) b;
        
        [btn.layer setCornerRadius: 3.0];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
