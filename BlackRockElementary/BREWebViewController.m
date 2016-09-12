//
//  BREWebViewController.m
//  BlackRockElementary
//
//  Created by Phil Maddaloni on 9/12/16.
//  Copyright © 2016 6kites. All rights reserved.
//

#import "ViewController.h"
#import "BREWebViewController.h"

@interface BREWebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIButton *backWebButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardWebButton;
@property (strong, nonatomic) IBOutlet UIButton *previousViewButton;

@end

@implementation BREWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.navigationController.navigationBar.hidden = NO;
    
    _webView.delegate = self;
    
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: _requestedUrl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    _webView.scalesPageToFit = YES;
    
    [_webView loadRequest: request];
    
    [_backWebButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_forwardWebButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    
    [_backWebButton setEnabled: NO];
    [_forwardWebButton setEnabled: NO];
    
    UIViewController *fromVC = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 2];
    
    NSString *fromVCName = NSStringFromClass([fromVC class]);
    
    NSLog(@"FROM CONTROLLER: %@", fromVCName);
    
    if ([fromVC isKindOfClass: [ViewController class]]) {
        
        [_previousViewButton setHidden: YES];
    }
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    
    [_backWebButton setEnabled: [_webView canGoBack]];
    [_forwardWebButton setEnabled: [_webView canGoForward]];
}

- (IBAction)didPressHomeButton:(id)sender {

    [self.navigationController popToRootViewControllerAnimated: YES];
}

- (IBAction)didPressBackButton:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didSelectBackButton:(id)sender {

    if ([_webView canGoBack]) {
        
        [_webView goBack];
    }
}

- (IBAction)didSelectForwardButton:(id)sender {

    if ([_webView canGoForward]) {
        
        [_webView goForward];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
