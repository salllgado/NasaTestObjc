//
//  AvailableApisCollectionView.m
//  NasaTestObjc
//
//  Created by Chrystian Salgado on 01/03/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

#import "AvailableApisCollectionView.h"
#import "AvailableApiCollectionViewCell.h"
#import "AvailableApi.h"
#import "DetailApiController.h"

@interface AvailableApisCollectionView ()

@property NSMutableArray *apis;

@end

@implementation AvailableApisCollectionView

static NSString * const reuseIdentifier = @"collectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AvailableApi *api1 = AvailableApi.new;
    api1.apiName = @"APOD";
    api1.apiURL = @"some";
    
    self.apis = [NSArray arrayWithObjects:api1, nil];
    
    // Register cell classes
    UINib *nib = [UINib nibWithNibName:@"AvailableApiCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.apis.count > 0) {
        return 1;
    } else {
        return 0;
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.apis.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AvailableApiCollectionViewCell *cell = (AvailableApiCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    AvailableApi *availableApi = (AvailableApi*) self.apis[indexPath.row];
    [cell displayUI: availableApi.apiName];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *storyboardName = @"DetailApi";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    DetailApiController *detailApiController = (DetailApiController*) [storyboard instantiateInitialViewController];
    detailApiController.availableApi = (AvailableApi*) self.apis[indexPath.row];
    [self showViewController:detailApiController sender:nil];
    
}

@end
