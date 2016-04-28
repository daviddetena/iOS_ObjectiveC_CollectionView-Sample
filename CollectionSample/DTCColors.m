//
//  DTCColors.m
//  CollectionSample
//
//  Created by David de Tena on 28/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//

#import "DTCColors.h"

@implementation DTCColors

#pragma mark - Methods

// Get a random color
-(UIColor *) randomColor{
    return [UIColor colorWithHue:[self randomFloat]
                      saturation:1.0
                      brightness:[self randomFloat]
                           alpha:[self randomFloat]];
}


#pragma mark - Utils

// Generates a random float between 0 and 1
-(float) randomFloat{
    return (arc4random() % 255) / 255.0f;
}

@end
