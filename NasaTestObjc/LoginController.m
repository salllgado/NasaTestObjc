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
    [self.loginHelper verifyLogin:user];
}

- (void)setupUIComponents {
    NSBundle *classBundle = [NSBundle bundleForClass:LoginController.self];
    _logoIv.image = [UIImage imageNamed: @"logo" inBundle: classBundle compatibleWithTraitCollection: NULL];
    
    _loginTf.placeholder = NSLocalizedString(@"LOGIN_TEXTFIELD_PLACEHOLDER", "");
    _passwordTf.placeholder = NSLocalizedString(@"LOGIN_TEXTFIELD_PLACEHOLDER", "");
}


// MARK: Actions

- (IBAction)actionScroll:(id)sender {
    [self scrollElement];
}

- (IBAction)actionLogin:(id)sender {
    [self saveDataOnDB:[self getUserLogin]];
}

- (IBAction)actionShowAllLogins:(id)sender {
//    [self performSegueWithIdentifier:@"routeToAllUsers" sender:self];
    AllUsersTableViewController *viewController = AllUsersTableViewController.new;
    [self.navigationController showViewController:viewController sender:NULL];
}
@end
