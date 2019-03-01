//
//  DetailApiController.h
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 01/03/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AvailableApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailApiController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageIv;
@property (weak, nonatomic) IBOutlet UILabel *lbDescription;

@property AvailableApi *availableApi;

@end

NS_ASSUME_NONNULL_END
