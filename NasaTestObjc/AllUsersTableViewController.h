//
//  AllUsersTableViewController.h
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 28/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm.h>
#import "Users.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllUsersTableViewController : UITableViewController

@property RLMResults<Users *> *users;

- (void)getUsers;

@end

NS_ASSUME_NONNULL_END
