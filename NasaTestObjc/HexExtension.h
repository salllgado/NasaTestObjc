//
//  HexExtension.h
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 28/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HexExtension : NSObject

- (UIColor*) getHexColor:(NSString*)hexColor;
@end

NS_ASSUME_NONNULL_END
