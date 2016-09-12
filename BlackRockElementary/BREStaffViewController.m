//
//  BREStaffViewController.m
//  BlackRockElementary
//
//  Created by Phil Maddaloni on 9/12/16.
//  Copyright © 2016 6kites. All rights reserved.
//

#import "BREStaffViewController.h"
#import "BREWebViewController.h"

#define ADMIN_BTN_IDX           0
#define OFFICE_BTN_IDX          1
#define PRESCHOOL_BTN_IDX       2
#define KINDERGARTEN_BTN_IDX    3
#define FIRST_GRADE_BTN_IDX     4
#define SECOND_GRADE_BTN_IDX    5
#define THIRD_GRADE_BTN_IDX     6
#define FOURTH_GRADE_BTN_IDX    7
#define FIFTH_GRADE_BTN_IDX     8
#define SPECIALS_BTN_IDX        9
#define ACADEMIC_SUPPT_BTN_IDX  10
#define GRADE_LVL_SUPPT_BTN_IDX 11
#define BUILDING_SUPPT_BTN_IDX  12
#define COMMUNITY_SCHOOLDS_BTN_IDX  13

@interface BREStaffViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *staffButtons;
@property (strong, nonatomic) NSMutableArray *urlButtonMappings;
@end

@implementation BREStaffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if (!_urlButtonMappings) {
        
        _urlButtonMappings = [[NSMutableArray alloc] init];
        
        _urlButtonMappings[ADMIN_BTN_IDX] = @"http://bres.svvsd.org/staff/administration";
        _urlButtonMappings[OFFICE_BTN_IDX] = @"http://bres.svvsd.org/staff/office";
        _urlButtonMappings[PRESCHOOL_BTN_IDX] = @"http://bres.svvsd.org/academics/preschool";
        _urlButtonMappings[KINDERGARTEN_BTN_IDX] = @"http://bres.svvsd.org/academics/kindergarten";
        _urlButtonMappings[FIRST_GRADE_BTN_IDX] = @"http://bres.svvsd.org/academics/first-grade";
        _urlButtonMappings[SECOND_GRADE_BTN_IDX] = @"http://bres.svvsd.org/academics/second-grade";
        _urlButtonMappings[THIRD_GRADE_BTN_IDX] = @"http://bres.svvsd.org/academics/third-grade";
        _urlButtonMappings[FOURTH_GRADE_BTN_IDX] = @"http://bres.svvsd.org/academics/fourth-grade";
        _urlButtonMappings[FIFTH_GRADE_BTN_IDX] = @"http://bres.svvsd.org/academics/fifth-grade";
        _urlButtonMappings[SPECIALS_BTN_IDX] = @"http://bres.svvsd.org/academics/specials";
        _urlButtonMappings[ACADEMIC_SUPPT_BTN_IDX] = @"http://bres.svvsd.org/staff/academic%20support";
        _urlButtonMappings[GRADE_LVL_SUPPT_BTN_IDX] = @"http://bres.svvsd.org/staff/grade%20level%20support";
        _urlButtonMappings[BUILDING_SUPPT_BTN_IDX] = @"http://bres.svvsd.org/staff/building%20support";
        _urlButtonMappings[COMMUNITY_SCHOOLDS_BTN_IDX] = @"http://bres.svvsd.org/staff/community%20schools";
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectHomeButton:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated: YES];
}

- (IBAction)didSelectStaffButton:(id)sender {
    
    UIButton *button = (UIButton *) sender;
    
    long btnIdx = button.tag - 100;
    
    NSLog(@"YOU SELECTED: %@ (%ld)", button.titleLabel.text, (long)button.tag);
    
    if (btnIdx >= _urlButtonMappings.count) {
        
        NSLog(@"ERROR: No url found for this action!");
        return;
    }
    
    NSLog(@"URL IS %@", _urlButtonMappings[btnIdx]);
    
    UIStoryboard *sb = [self storyboard];
    
    if (sb) {
        
        BREWebViewController *wvc = (BREWebViewController *) [sb instantiateViewControllerWithIdentifier:@"bre_web"];
        
        wvc.requestedUrl = _urlButtonMappings[btnIdx];
        
        if (wvc) {
            
            [self.navigationController pushViewController: wvc animated:YES];
        }
    }
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
