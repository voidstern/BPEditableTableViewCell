//
//  BPBrightnessEditableTableViewCell.h
//  Folio
//
//  Created by Jon Olson on 7/29/10.
//  Copyright 2010 Ballistic Pigeon, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPEditableTableViewCell.h"

@interface BPSliderEditableTableViewCell : BPEditableTableViewCell
{
    
}
@property (readonly) UISlider *slider;

- (id)initWithLabel:(NSString *)label floatValue:(float)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock;

@end
