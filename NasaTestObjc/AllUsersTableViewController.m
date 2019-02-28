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

@interface AllUsersTableViewController ()

@end

@implementation AllUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Lista de Usuarios";
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];

    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
    
    NSBundle *cellBundle = [NSBundle bundleForClass:AllUsersTableViewController.self];
    UINib *cellNib = [UINib nibWithNibName: @"AllUsersTableViewCell" bundle: cellBundle];
    [self.tableView registerNib:cellNib forCellReuseIdentifier: @"allUsersTableViewCell"];
    
    self.getUsers;
}

- (void)getUsers {
    LoginHelper *loginHelper = LoginHelper.new;
    self.users = [loginHelper listAllUsers];
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

@end
