//
//  BRESchoolInfoViewController.m
//  BlackRockElementary
//
//  Created by Phil Maddaloni on 9/12/16.
//  Copyright © 2016 6kites. All rights reserved.
//

#import "BRESchoolInfoViewController.h"
#import "BREWebViewController.h"

#define ABOUT_BTN_IDX               0
#define LOCATE_BTN_IDX              1
#define ONLINE_PAYMENTS_BTN_IDX     2
#define INFINITE_CAMPUS_BTN_IDX     3
#define REPORT_ABSENCE_BTN_IDX      4
#define SEND_PICTURE_BTN_IDX        5
#define LUNCH_MENU_BTN_IDX          6
#define BLACKROCK_SITE_BTN_IDX      7
#define SUPPLY_LIST_BTN_IDX         8
#define SVVSD_CALENDAR_BTN_IDX      9
#define SVVSD_HOME_BTN_IDX          10
#define ONLINE_RESOURCES_BTN_IDX    11

@interface BRESchoolInfoViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *schoolInfoButtons;
@property (strong, nonatomic) NSMutableArray *urlButtonMappings;
@end

@implementation BRESchoolInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!_urlButtonMappings) {
    
        _urlButtonMappings = [[NSMutableArray alloc] init];
        
        _urlButtonMappings[ABOUT_BTN_IDX] = @"http://bres.svvsd.org/about/mission-vision";
        _urlButtonMappings[LOCATE_BTN_IDX] = @"https://www.google.com/maps/place/Black+Rock+Elementary+School/@40.0062946,-105.0181218,17z/data=!4m15!1m9!4m8!1m0!1m6!1m2!1s0x876c0a91c2b59639:0xcaee5136baa6bf7f!2sBlack+Rock+Elementary+School,+2000+Mountain+View+Blvd,+Erie,+CO+80516!2m2!1d-105.0159278!2d40.0062946!3m4!1s0x876c0a91c2b59639:0xcaee5136baa6bf7f!8m2!3d40.0062946!4d-105.0159278";
        _urlButtonMappings[ONLINE_PAYMENTS_BTN_IDX] = @"http://svvsd.org/online-payments";
        _urlButtonMappings[INFINITE_CAMPUS_BTN_IDX] = @"https://ic.svvsd.org/campus/portal/stvrain.jsp";
        _urlButtonMappings[REPORT_ABSENCE_BTN_IDX] = @"http://bres.svvsd.org/report-absence";
        _urlButtonMappings[SEND_PICTURE_BTN_IDX] = @"mailto:spencer_linda@svvsd.org";
        _urlButtonMappings[LUNCH_MENU_BTN_IDX] = @"http://www.schoolnutritionandfitness.com/index.php?page=menus&sid=1907111832370459";
        _urlButtonMappings[BLACKROCK_SITE_BTN_IDX] = @"http://bres.svvsd.org/";
        _urlButtonMappings[SUPPLY_LIST_BTN_IDX] = @"http://svvsd.org/files/2016-17-Elementary-Supply-List-2.pdf";
        _urlButtonMappings[SVVSD_CALENDAR_BTN_IDX] = @"http://svvsd.org/about/departments/learning-services/school-calendar";
        _urlButtonMappings[SVVSD_HOME_BTN_IDX] = @"http://svvsd.org/";
        _urlButtonMappings[ONLINE_RESOURCES_BTN_IDX] = @"http://svvsd.org/";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectHomeButton:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated: YES];
}

- (IBAction)didSelectSchoolInfoButton:(id)sender {
    
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
