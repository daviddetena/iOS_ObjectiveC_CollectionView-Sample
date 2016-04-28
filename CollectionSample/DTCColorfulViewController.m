//
//  DTCColorfulViewController.m
//  CollectionSample
//
//  Created by David de Tena on 28/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//

#import "DTCColorfulViewController.h"
#import "DTCColors.h"

@interface DTCColorfulViewController ()

#pragma mark - Properties
// Property for our model
@property (nonatomic, strong) DTCColors *model;

// Class methods used as a "constant"
+(NSString *) randomColorCellId;
+(NSInteger) maxRandomColorsToDisplay;

@end

@implementation DTCColorfulViewController


#pragma mark - Class methods

+(NSString *) randomColorCellId{
    return @"randomColorCell";
}

+(NSInteger) maxRandomColorsToDisplay{
    return 104;
}


#pragma mark - Init
- (id) initWithModel:(DTCColors *) model layout:(UICollectionViewLayout *) aLayout{
    if(self = [super initWithCollectionViewLayout:aLayout]){
        _model = model;
        self.title = @"Colorfull Stack";
    }
    return self;
}


#pragma mark - View lifecycle

// Add a default background and register the cell that the CollectionView will be using
- (void) viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell
    [self registerRandomColorCell];
}



#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Utils
// Register cell => Use class registering as we use system cell
- (void) registerRandomColorCell{
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:[DTCColorfulViewController randomColorCellId]];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [DTCColorfulViewController maxRandomColorsToDisplay];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Grab a reusable cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[DTCColorfulViewController randomColorCellId] forIndexPath:indexPath];
    
    // Configure the cell's background color with the model's random color
    cell.backgroundColor = [self.model randomColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
