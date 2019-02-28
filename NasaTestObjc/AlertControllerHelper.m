//
//  AlertControllerHelper.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 28/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "AlertControllerHelper.h"
#import "UIKit/UIKit.h"
#import "HexExtension.h"

@implementation AlertControllerHelper

- (UIAlertController*) createAlertController: (NSString*)title: (NSString*)message {
    UIAlertController *alertController = UIAlertController.new;
    alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancell = [UIAlertAction actionWithTitle: NSLocalizedString(@"ACTION_ALERT_CANCELAR", "") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:true completion:NULL];
    }];
    [alertController addAction:actionCancell];
    
    HexExtension *hexExtension = HexExtension.new;
    UIColor *alertTintColor = [hexExtension getHexColor:@"929AFB"];
    alertController.view.tintColor = alertTintColor;
    
    return alertController;
}

@end
