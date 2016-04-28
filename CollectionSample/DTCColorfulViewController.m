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

// Class methods used as "constants"
+(NSString *) randomColorCellId;
+(NSString *) gradientColorCellId;

+(NSInteger) maxRandomColorsToDisplay;
+(NSInteger) maxGradientColorsToDisplay;

+(NSUInteger) randomColorSection;
+(NSUInteger) gradientColorSection;

@end

@implementation DTCColorfulViewController


#pragma mark - Class methods

// Cell id for cells with random colors
+(NSString *) randomColorCellId{
    return @"randomColorCell";
}

// Cell id for cells with gradient colors
+(NSString *) gradientColorCellId{
    return @"gradientColorCell";
}

// Max number of colors to display
+(NSInteger) maxRandomColorsToDisplay{
    return 104;
}

// Max number of gradients to display
+(NSInteger) maxGradientColorsToDisplay{
    return 104;
}

// Random cells are in section #1
+(NSUInteger) randomColorSection{
    return 1;
}

// Gradient cells are in section #0
+(NSUInteger) gradientColorSection{
    return 0;
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
    
    // Register random color cells
    [self registerRandomColorCell];
    
    // Register gradient color cells
    [self registerGradientColorCell];
}



#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Utils
// Register random color cell => Use class registering as we use system cell
- (void) registerRandomColorCell{
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:[DTCColorfulViewController randomColorCellId]];
}

// Register gradient color cell => Use class registering as we use system cell
- (void) registerGradientColorCell{
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:[DTCColorfulViewController gradientColorCellId]];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if(section == [DTCColorfulViewController randomColorSection]){
        // Number of random color cells
        return [DTCColorfulViewController maxRandomColorsToDisplay];
    }
    else{
        // Number of gradient color cells
        return [DTCColorfulViewController maxGradientColorsToDisplay];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Grab a reusable cell
    UICollectionViewCell *cell;
    
    
    if(indexPath.section == [DTCColorfulViewController randomColorSection]){
        // Random color cell
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:[DTCColorfulViewController randomColorCellId] forIndexPath:indexPath];
        cell.backgroundColor = [self.model randomColor];
    }
    else{
        // Gradient color cell
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:[DTCColorfulViewController gradientColorCellId] forIndexPath:indexPath];
        cell.backgroundColor = [self.model colorGradientAt:indexPath.item to:[DTCColorfulViewController maxGradientColorsToDisplay]];
    }
    
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
