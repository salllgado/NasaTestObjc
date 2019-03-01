//
//  LoginHelper.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 27/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "LoginHelper.h"
#import "RealmManager.h"
#import "Realm/Realm.h"
#import "Users.h"

@implementation LoginHelper

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = RealmManager.new;
    }
    return self;
}

- (BOOL)verifyLogin: (Users*)userLogin {
    
    if ([userLogin.login isEqualToString:@""] || [userLogin.password isEqualToString:@""]) {
        return NO;
    }
    
    RLMResults<Users *> *users = self.listAllUsers;
    Users *user = Users.new;
    BOOL match = NO;
    
    for (user in users) {
        if (user == userLogin) {
            match = YES;
        }
    }
    
    if (match == NO) {
        [self.manager saveUsers:userLogin];
    }
    
    return YES;
}

- (RLMResults<Users *>*) listAllUsers {
    return [self.manager getUsers];
}


@end
