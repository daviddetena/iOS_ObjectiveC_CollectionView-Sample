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

// Creates a gradient with a color [current] in [maximum] steps
-(UIColor *) colorGradientAt:(NSUInteger) current to:(NSUInteger) maximum{
    
    float currentHue = (current*1.0f)/(maximum*1.0f);
    return [UIColor colorWithHue:currentHue saturation:1.0 brightness:0.8 alpha:1.0];
}


#pragma mark - Utils

// Generates a random float between 0 and 1
-(float) randomFloat{
    return (arc4random() % 255) / 255.0f;
}

@end
