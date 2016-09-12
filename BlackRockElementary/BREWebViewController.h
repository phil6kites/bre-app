//
//  BREWebViewController.h
//  BlackRockElementary
//
//  Created by Phil Maddaloni on 9/12/16.
//  Copyright © 2016 6kites. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BREWebViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) NSString *requestedUrl;
@end
