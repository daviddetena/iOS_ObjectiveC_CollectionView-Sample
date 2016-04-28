//
//  DTCRandomColorCell.m
//  CollectionSample
//
//  Created by David de Tena on 28/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//

#import "DTCRandomColorCell.h"
#import "UIColor+Colorful.h"

@interface DTCRandomColorCell()

@property (weak, nonatomic) IBOutlet UILabel *hexLabel;
// Flag to decide if the cell should animate when changing of color
@property (nonatomic) BOOL shouldAnimateChangeOfColor;

@end


@implementation DTCRandomColorCell

#pragma mark - Init & dealloc

- (void) awakeFromNib {
    [super awakeFromNib];
    
    // Initially, cell should not animate color changing
    self.shouldAnimateChangeOfColor = NO;
    // Setup KVO to observe changes in the model
    [self setupKVO];
}

- (void) dealloc{
    // Unsuscribe KVO
    [self tearDownKVO];
}


#pragma mark - View lifecycle

- (void) prepareForReuse{
    [super prepareForReuse];
    
    // When preparing for reuse, back to initial status of animating color
    self.shouldAnimateChangeOfColor = NO;
    
    // A new color when preparing for reuse
    self.color = [UIColor x11FloralWhiteColor];
}



#pragma mark - KVO

// Suscribe for notifications when model changes
- (void) setupKVO{
    [self addObserver:self
           forKeyPath:@"color"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
}

// Unsuscribe from notifications when model changes
- (void) tearDownKVO{
    [self removeObserver:self
              forKeyPath:@"color"];
}

// KVO method to check old and new value
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    // In this case, we will change:
    // - The label inside the cell will be the color's hex code
    // - The cell background will be as of the current cell color
    // We use a short animation to present the background color
    self.hexLabel.text = [self.color hexString];
    
    // If shouldAnimate = NO, simulate no animation
    float duration = 0.0f;
    if(self.shouldAnimateChangeOfColor){
        duration = 0.6f;
    }
    
    [UIView animateWithDuration:duration animations:^{
        self.backgroundColor = self.color;
        self.hexLabel.textColor = [self.color contrastingTextColor];
    }];
    
    self.shouldAnimateChangeOfColor = YES;
}

@end
