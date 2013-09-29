//
//  LiveOutputViewController.m
//  MarkyMark
//
//  Created by Eric Allam on 9/28/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "LiveOutputViewController.h"

@interface LiveOutputViewController ()
@property (strong, nonatomic) NSString *html;
@end

@implementation LiveOutputViewController

- (instancetype)initWithHTML:(NSString *)html;
{
    self = [self init];
    
    if (self) {
        _html = html;
    }
    
    return self;
}

- (IBAction)dismissMe:(id)sender;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    
    NSError *error = nil;
    
    NSAttributedString *preview = [[NSAttributedString alloc] initWithData:[_html dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:nil error:&error];
    
    if (!error) {
        self.liveView.attributedText = preview;
    }else{
        NSLog(@"Error building attributed string: %@", error);
        self.liveView.text = _html;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
