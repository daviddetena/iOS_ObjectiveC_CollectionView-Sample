//
//  DTCColorfulViewController.m
//  CollectionSample
//
//  Created by David de Tena on 28/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//

#import "DTCColorfulViewController.h"
#import "DTCColors.h"
#import "UIColor+Colorful.h"
#import "DTCRandomColorCell.h"

@interface DTCColorfulViewController ()

#pragma mark - Properties
// Property for our model
@property (nonatomic, strong) DTCColors *model;
@property (nonatomic) NSInteger maxRandomColorsToDisplay;
@property (nonatomic) NSInteger maxGradientColorsToDisplay;

// Class methods used as "constants"
+(NSString *) randomColorCellId;
+(NSString *) gradientColorCellId;
+(NSString *) sectionHeaderId;

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

+(NSString *) sectionHeaderId{
    return @"sectionHeaderId";
}

// Random cells are in section #0
+(NSUInteger) randomColorSection{
    return 0;
}

// Gradient cells are in section #1
+(NSUInteger) gradientColorSection{
    return 1;
}



#pragma mark - Init
- (id) initWithModel:(DTCColors *) model layout:(UICollectionViewLayout *) aLayout{
    if(self = [super initWithCollectionViewLayout:aLayout]){
        _model = model;
        _maxRandomColorsToDisplay = 104;        // 104 random colors to display when launched
        _maxGradientColorsToDisplay = 104;      // 104 gradient colors to display when launched
        self.title = @"Colorfull Stack";
    }
    return self;
}


#pragma mark - View lifecycle

// Add a default background and register the cell that the CollectionView will be using
- (void) viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cells for random and gradient colors, and register header
    [self registerRandomColorCell];
    [self registerGradientColorCell];
    [self registerSectionHeader];
    
    // Create button to add a random color
    [self addColorButton];
}



#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Utils
// Register random color cell => Use nib registering as we use our custom cell
- (void) registerRandomColorCell{
    
    // Read cell nib
    UINib *nib = [UINib nibWithNibName:@"DTCRandomColorCell" bundle:nil];
    
    // Register it to the cell
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:[DTCColorfulViewController randomColorCellId]];
}

// Register gradient color cell => Use class registering as we use system cell
- (void) registerGradientColorCell{
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:[DTCColorfulViewController gradientColorCellId]];
}

// UICollectionReusableView is used for headers and footers, and is superclass for UICollectionCellView
- (void) registerSectionHeader{
    [self.collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:[DTCColorfulViewController sectionHeaderId]];
}


// Create and display an UIBarButtonItem in the navigation controller for adding a new random color
- (void) addColorButton{
    UIBarButtonItem *addColor = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                              target:self
                                                                              action:@selector(addNewRandomColor:)];
    self.navigationItem.rightBarButtonItem = addColor;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if(section == [DTCColorfulViewController randomColorSection]){
        // Number of random color cells
        return [self maxRandomColorsToDisplay];
    }
    else{
        // Number of gradient color cells
        return [self maxGradientColorsToDisplay];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(indexPath.section == [DTCColorfulViewController randomColorSection]){
        // Custom random color cell and configure it
        DTCRandomColorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[DTCColorfulViewController randomColorCellId]
                                                                             forIndexPath:indexPath];
        
        cell.color = [self.model randomColor];
        return cell;
    }
    else{
        // Grab a reusable cell for gradient color cell
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[DTCColorfulViewController gradientColorCellId]
                                                                               forIndexPath:indexPath];
        cell.backgroundColor = [self.model colorGradientAt:indexPath.item to:[self maxGradientColorsToDisplay]];
        return cell;
    }
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView
            viewForSupplementaryElementOfKind:(NSString *)kind
                                  atIndexPath:(NSIndexPath *)indexPath{

    UICollectionReusableView *supView;
    
    if(kind == UICollectionElementKindSectionHeader){
        // View is header => Recycle or create header
        supView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                     withReuseIdentifier:[DTCColorfulViewController sectionHeaderId]
                                                            forIndexPath:indexPath];
        
        // Configure UICollectionReusableView
        supView.backgroundColor = [UIColor colorWithWhite:0.65 alpha:1.0];
        
        // Check if the view has subviews and delete them so the title does not overlay
        for (UIView *each in supView.subviews) {
            [each removeFromSuperview];
        }
        
        // Header label with supView dimensions
        UILabel *title = [[UILabel alloc] initWithFrame:supView.bounds];
        title.textColor = [UIColor whiteColor];
        
        title.text = (indexPath.section == [DTCColorfulViewController randomColorSection]) ? @"Random colors" : @"Gradient colors";
        [supView addSubview:title];
    }    
    return supView;
}


#pragma mark <UICollectionViewDelegate>

// Add an animation when a color is tapped and turns to its complementary color (if random colors)
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == [DTCColorfulViewController randomColorSection]){
        DTCRandomColorCell *cell = (DTCRandomColorCell *) [collectionView cellForItemAtIndexPath:indexPath];
        cell.color = [cell.color complementaryColor];
    }
}



#pragma mark - Actions
// Update model (max random colors) and add a new item for the collection view
- (void) addNewRandomColor:(id) sender{
    self.maxRandomColorsToDisplay = self.maxRandomColorsToDisplay + 1;
    
    // Insert new item at the beginning of section #0
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0
                                                                       inSection:[DTCColorfulViewController randomColorSection]]]];
}

@end
