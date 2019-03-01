//
//  AvailableApiCollectionViewCell.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 01/03/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "AvailableApiCollectionViewCell.h"

@implementation AvailableApiCollectionViewCell

- (void)displayUI:(NSString*)login {
    self.containerView.layer.cornerRadius = 10;
    self.descriptionLbl.text = login;
}

@end
