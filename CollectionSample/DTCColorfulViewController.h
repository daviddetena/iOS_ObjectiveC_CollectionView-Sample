//
//  DTCColorfulViewController.h
//  CollectionSample
//
//  Created by David de Tena on 28/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTCColors;

@interface DTCColorfulViewController : UICollectionViewController

#pragma mark - Methods
- (id) initWithModel:(DTCColors *) model layout:(UICollectionViewLayout *) aLayout;

@end
