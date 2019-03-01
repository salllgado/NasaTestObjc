//
//  RealmManager.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 27/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "RealmManager.h"
#import "Realm/Realm.h"
#import "Users.h"

@implementation RealmManager

- (void)saveUsers: (Users *)user {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:user];
    }];
}

- (RLMResults*)getUsers {
    RLMResults<Users *> *users = [Users allObjects];
    return users;
}

-(void)clearRealm {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
}

@end
