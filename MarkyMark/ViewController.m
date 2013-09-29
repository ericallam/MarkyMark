//
//  ViewController.m
//  MarkyMark
//
//  Created by Eric Allam on 9/28/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "ViewController.h"
#import "MMMarkdown.h"
#import "LiveOutputViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.markdownEditor.text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Example" ofType:@"md"]  encoding:NSUTF8StringEncoding error:nil];
	
    [self.viewHTML addTarget:self action:@selector(viewLive:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewLive:(id)sender
{
    NSLog(@"Viewing live...");
    NSError *error = nil;
    NSString *markdown = self.markdownEditor.text;
    NSString *html = [MMMarkdown HTMLStringWithMarkdown:markdown error:&error];
    
    if (!error) {
        NSLog(@"Converted to this HTML: %@", html);
        
        LiveOutputViewController *liveVC = [[LiveOutputViewController alloc] initWithHTML:html];
        
        [self presentViewController:liveVC animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
