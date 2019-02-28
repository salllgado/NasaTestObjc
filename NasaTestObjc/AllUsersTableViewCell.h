//
//  AllUsersTableViewCell.h
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 28/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AllUsersTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *loginLbl;

- (void)displayUI:(NSString*)login;

@end

NS_ASSUME_NONNULL_END
