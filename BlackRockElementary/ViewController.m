//
//  ViewController.m
//  BlackRockElementary
//
//  Created by Phil Maddaloni on 7/31/16.
//  Copyright © 2016 6kites. All rights reserved.
//

#import "ViewController.h"
#import "BRESchoolInfoViewController.h"
#import "BREWebViewController.h"
#import "BREStaffViewController.h"

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

- (void) viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectCalendar:(id)sender {

    UIStoryboard *sb = [self storyboard];
    
    if (sb) {
        
        BREWebViewController *wvc = (BREWebViewController *) [sb instantiateViewControllerWithIdentifier:@"bre_web"];
        
        wvc.requestedUrl = @"http://brepto.com/calendar/";
        
        if (wvc) {
            
            [self.navigationController pushViewController: wvc animated:YES];
        }
    }

}

- (IBAction)didSelectStaff:(id)sender {
    
    UIStoryboard *sb = [self storyboard];
    
    if (sb) {
        
        BREStaffViewController *svc = (BREStaffViewController *) [sb instantiateViewControllerWithIdentifier:@"bre_staff"];
        
        if (svc) {
            
            [self.navigationController pushViewController:svc animated:YES];
        }
    }

}

- (IBAction)didSelectSchoolInformation:(id)sender {

    UIStoryboard *sb = [self storyboard];
    
    if (sb) {
        
        BRESchoolInfoViewController *sivc = (BRESchoolInfoViewController *) [sb instantiateViewControllerWithIdentifier:@"bre_school_info"];
        
        if (sivc) {
            
            [self.navigationController pushViewController:sivc animated:YES];
        }
    }
}

@end
