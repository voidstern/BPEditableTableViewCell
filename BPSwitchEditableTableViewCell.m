//
//  BPSwitchEditableTableViewCell.m
//
//  Created by Jon Olson on 10/14/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "BPSwitchEditableTableViewCell.h"


@implementation BPSwitchEditableTableViewCell

+ (Class)controlClass
{
	return [UISwitch class];
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        [self.switchControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    return self;
}

- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [self initWithLabel:label reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.switchControl.on = [value boolValue];
    }
    return self;
}

- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    self = [self initWithLabel:label value:value reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.switchControl handleControlEvents:UIControlEventValueChanged withBlock:actionBlock];
        self.switchControl.on = [value boolValue];
    }
    return self;
}

- (id)initWithLabel:(NSString *)label boolValue:(BOOL)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    return [self initWithLabel:label value:@(value) reuseIdentifier:reuseIdentifier andBlock:actionBlock];
}

#pragma mark - Switch accessor

- (UISwitch *)switchControl
{
	return (UISwitch *)self.control;
}

#pragma mark - Value accessors

- (id)value
{
	return [NSNumber numberWithBool:self.switchControl.on];
}

- (void)setValue:(id)aValue
{
	self.switchControl.on = [aValue boolValue];
}

#pragma mark - Layout

- (void)layoutSubviews
{
	[super layoutSubviews];
    [self.detailTextLabel removeFromSuperview];
	control.frame = CGRectMake(216, 8, 0, 0);
}

@end
