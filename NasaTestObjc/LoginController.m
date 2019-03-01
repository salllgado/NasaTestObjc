//
//  ViewController.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 27/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "LoginController.h"
#import "LoginHelper.h"
#import "Users.h"
#import "NasaTestObjc-Swift.h"
#import "Realm/Realm.h"
#import "AllUsersTableViewController.h"
#import "AvailableApisCollectionView.h"
#import "AlertControllerHelper.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoIv;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContent;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;

@property (weak, nonatomic) IBOutlet UITextField *loginTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;

@property (strong, nonatomic) LoginHelper *loginHelper;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUIComponents];
    
    NSString *fileUrl = (NSString *) [RLMRealmConfiguration defaultConfiguration].fileURL;
    NSLog(@"%@", fileUrl);
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}

- (void)scrollElement {
    [_scrollViewContent setContentOffset: (CGPointMake(self.view.frame.size.width, 0)) animated: YES];
}

- (Users *)getUserLogin {
    Users *user = Users.new;
    user.login = _loginTf.text;
    user.password = _passwordTf.text;
    
    return user;
}

- (void)saveDataOnDB :(Users*)user {
    _loginHelper = LoginHelper.new;
    if ([self.loginHelper verifyLogin:user] == YES) {
        self.showListApisController;
    } else {
        AlertControllerHelper *alertHelper = AlertControllerHelper.new;
        NSString *message = NSLocalizedString(@"ERRO_LOGIN_INVALIDO", "");
        UIAlertController *alertController = [alertHelper createAlertController:@"" :message];
        
        id rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        [rootViewController presentViewController:alertController animated:YES completion:NULL];
    }
}

- (void)setupUIComponents {
    NSBundle *classBundle = [NSBundle bundleForClass:LoginController.self];
    _logoIv.image = [UIImage imageNamed: @"logo" inBundle: classBundle compatibleWithTraitCollection: nil];
    
    _loginTf.placeholder = NSLocalizedString(@"LOGIN_TEXTFIELD_PLACEHOLDER", "");
    _passwordTf.placeholder = NSLocalizedString(@"LOGIN_TEXTFIELD_PLACEHOLDER", "");
}

- (void)showListApisController {
    NSString *storyboardName = @"AvailableApis";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UINavigationController *navigationController = (UINavigationController*) [storyboard instantiateInitialViewController];
    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
}


// MARK: Actions

- (IBAction)actionScroll:(id)sender {
    [self scrollElement];
}

- (IBAction)actionLogin:(id)sender {
    [self saveDataOnDB:[self getUserLogin]];
}

- (IBAction)actionShowAllLogins:(id)sender {
    AllUsersTableViewController *viewController = AllUsersTableViewController.new;
    [self.navigationController showViewController:viewController sender:NULL];
}
@end
