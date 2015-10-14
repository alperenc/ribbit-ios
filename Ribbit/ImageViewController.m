//
//  ImageViewController.m
//  Ribbit
//
//  Created by Alp Eren Can on 23/04/14.
//  Copyright (c) 2014 Alp Eren Can. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFFile *imageFile = [self.message objectForKey:@"file"];
    NSURL *imageFileURL = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHideNavBar)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    
//    NSString *senderName = [self.message objectForKey:@"senderName"];
//    NSString *title = [NSString stringWithFormat:@"Sent from %@", senderName];
//    self.navigationItem.title = title;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([self respondsToSelector:@selector(timeout)]) {
        [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark - Helper methods

- (void)timeout
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showHideNavBar
{
    if (self.navigationController.navigationBarHidden) {
        NSString *senderName = [self.message objectForKey:@"senderName"];
        NSString *title = [NSString stringWithFormat:@"Sent from %@", senderName];
        self.navigationItem.title = title;
        
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];

    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
