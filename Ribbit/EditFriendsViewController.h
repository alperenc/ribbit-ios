//
//  EditFriendsViewController.h
//  Ribbit
//
//  Created by Alp Eren Can on 21/04/14.
//  Copyright (c) 2014 Alp Eren Can. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsViewController : UITableViewController

@property (strong, nonatomic) NSArray *allUsers;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSMutableArray *friends;

- (BOOL)isFriend:(PFUser *)user;

@end
