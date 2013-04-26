//
//  BPNumericEditableTableViewCell.h
//  Fiery
//
//  Created by Lukas Burgstaller on 3/29/13.
//  Copyright (c) 2013 Lukas Burgstaller. All rights reserved.
//

#import "BPEditableTableViewCell.h"

@interface BPStepperEditableTableViewCell : BPEditableTableViewCell
{
    
}
@property (readonly) UIStepper *stepper;

- (id)initWithLabel:(NSString *)label integerValue:(NSInteger)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock;

@end
