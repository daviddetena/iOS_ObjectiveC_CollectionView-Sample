//
//  DTCRandomColorCell.h
//  CollectionSample
//
//  Created by David de Tena on 28/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//
//  In such a specific case, where we have a custom cell
//  and a little model, it's a good way to break the MVC
//  pattern and make this view (this cell) know about the
//  model (in this case, the color).
//
//  KVO is used by the cell to observe changes in the model
//


#import <UIKit/UIKit.h>

@interface DTCRandomColorCell : UICollectionViewCell

#pragma mark - Properties
@property (nonatomic, strong) UIColor *color;

@end
