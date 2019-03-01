//
//  RealmManager.h
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 27/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Users.h"

NS_ASSUME_NONNULL_BEGIN

@interface RealmManager : NSObject

/// Save the specific User Object inside realm
- (void)saveUsers: (Users *)user;

/// Get all users from realm
- (RLMResults*)getUsers;

-(void)clearRealm;

@end

NS_ASSUME_NONNULL_END
