//
//  DTCColors.h
//  CollectionSample
//
//  Created by David de Tena on 28/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DTCColors : NSObject

#pragma mark - Methods
-(UIColor *) colorGradientAt:(NSUInteger) current to:(NSUInteger) maximum;
-(UIColor *) randomColor;

@end
