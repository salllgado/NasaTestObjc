//
//  ViewController.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 27/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "ViewController.h"
#import "LoginHelper.h"
#import "Users.h"
#import "NasaTestObjc-Swift.h"
#import "Realm/Realm.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoIv;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContent;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;

@property (weak, nonatomic) IBOutlet UITextField *loginTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;

@property (strong, nonatomic) LoginHelper *loginHelper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUIComponents];
    
    NSString *fileUrl = (NSString *) [RLMRealmConfiguration defaultConfiguration].fileURL;
    NSLog(@"%@", fileUrl);
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

// MARK: Actions

- (IBAction)actionScroll:(id)sender {
    [self scrollElement];
}

- (IBAction)actionLogin:(id)sender {
    [self saveDataOnDB:[self getUserLogin]];
}

- (void)setupUIComponents {
    NSBundle *classBundle = [NSBundle bundleForClass:ViewController.self];
    _logoIv.image = [UIImage imageNamed: @"logo" inBundle: classBundle compatibleWithTraitCollection: NULL];
    
    _loginTf.placeholder = NSLocalizedString(@"LOGIN_TEXTFIELD_PLACEHOLDER", "");
    _passwordTf.placeholder = NSLocalizedString(@"LOGIN_TEXTFIELD_PLACEHOLDER", "");
}

@end
