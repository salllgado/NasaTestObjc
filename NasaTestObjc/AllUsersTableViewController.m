//
//  AllUsersTableViewController.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 28/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "AllUsersTableViewController.h"
#import "AllUsersTableViewCell.h"
#import "LoginHelper.h"
#import "HexExtension.h"
#import "AlertControllerHelper.h"

@interface AllUsersTableViewController ()

@end

@implementation AllUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureNavigationBar];
    
    NSBundle *cellBundle = [NSBundle bundleForClass:AllUsersTableViewController.self];
    UINib *cellNib = [UINib nibWithNibName: @"AllUsersTableViewCell" bundle: cellBundle];
    [self.tableView registerNib:cellNib forCellReuseIdentifier: @"allUsersTableViewCell"];
    
    [self retriveUsers];
}

- (void)configureNavigationBar {
    HexExtension *hexExtension = HexExtension.new;
    UIColor *navBarColor = [hexExtension getHexColor:@"929AFB"];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = navBarColor;
    self.navigationItem.title = NSLocalizedString(@"LIST_OF_USERS", "");
    
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
    
    // Add bar button to reset all bank.
}

- (void)retriveUsers {
    LoginHelper *loginHelper = LoginHelper.new;
    self.users = [loginHelper listAllUsers];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allUsersTableViewCell" forIndexPath:indexPath];
    
    AllUsersTableViewCell *allUsersTableViewCell = (AllUsersTableViewCell*) cell;
    NSString *text = self.users[indexPath.row].login;
    [allUsersTableViewCell displayUI:text];
    
    return allUsersTableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AlertControllerHelper *alertHelper = AlertControllerHelper.new;
    NSString *message = self.users[indexPath.row].password;
    UIAlertController *alertController = [alertHelper createAlertController:@"" :message];
    
    id rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    [rootViewController presentViewController:alertController animated:YES completion:NULL];
}

@end
