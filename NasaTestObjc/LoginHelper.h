//
//  LoginHelper.h
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 27/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealmManager.h"
#import "Realm/Realm.h"
#import "Users.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginHelper : NSObject

@property (strong, nonatomic) RealmManager *manager;

- (void)verifyLogin: (Users*)userLogin;
- (RLMResults<Users *>*) listAllUsers;

@end

NS_ASSUME_NONNULL_END
