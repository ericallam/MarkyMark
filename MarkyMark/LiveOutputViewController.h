//
//  LiveOutputViewController.h
//  MarkyMark
//
//  Created by Eric Allam on 9/28/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveOutputViewController : UIViewController

- (instancetype)initWithHTML:(NSString *)html;
- (IBAction)dismissMe:(id)sender;
@property (nonatomic, strong) IBOutlet UITextView *liveView;
@end
