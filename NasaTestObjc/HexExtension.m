//
//  HexExtension.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 28/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "HexExtension.h"
#import <UIKit/UIKit.h>

@implementation HexExtension

- (UIColor*) getHexColor:(NSString*)hexColor {
    unsigned resultValue = 0;
    NSString *formatedString = hexColor.uppercaseString;
    
    if ([formatedString hasPrefix: @"#"]) {
        [formatedString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    
    NSScanner *scanner = [NSScanner scannerWithString: formatedString];
    [scanner scanHexInt: &resultValue];
    
    return [UIColor colorWithRed:((float)((resultValue & 0xFF0000) >> 16))/255.0 \
                    green:((float)((resultValue & 0x00FF00) >>  8))/255.0 \
                     blue:((float)((resultValue & 0x0000FF) >>  0))/255.0 \
                    alpha:1.0];
}

@end
