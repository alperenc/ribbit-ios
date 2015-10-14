//
//  ImageViewController.h
//  Ribbit
//
//  Created by Alp Eren Can on 23/04/14.
//  Copyright (c) 2014 Alp Eren Can. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController

@property (strong, nonatomic) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
