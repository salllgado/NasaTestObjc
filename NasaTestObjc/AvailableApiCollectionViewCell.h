//
//  AvailableApiCollectionViewCell.h
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 01/03/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AvailableApiCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (void)displayUI:(NSString*)login;

@end

NS_ASSUME_NONNULL_END
