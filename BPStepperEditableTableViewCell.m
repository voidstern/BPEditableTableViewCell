//
//  BPNumericEditableTableViewCell.m
//
//  Created by Lukas Burgstaller on 3/29/13.
//  Copyright (c) 2013 Lukas Burgstaller. All rights reserved.
//

#import "BPStepperEditableTableViewCell.h"

@implementation BPStepperEditableTableViewCell

+ (Class)controlClass
{
	return [UIStepper class];
}

- (UIStepper *)stepper
{
	return (UIStepper *)self.control;
}

#pragma mark - Construction and deallocation

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
		self.stepper.autorepeat = YES;
        [self.stepper addTarget:self action:@selector(updateLabel) forControlEvents:UIControlEventValueChanged];
        [self.stepper addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        self.detailTextLabel.textAlignment = NSTextAlignmentRight;
	}
	
	return self;
}

- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [self initWithLabel:label reuseIdentifier:reuseIdentifier])
    {
        self.stepper.value = [value doubleValue];
        self.detailTextLabel.text = [NSString stringWithFormat:@"%.0lf", self.stepper.value];
	}
	
	return self;
}

- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    self = [self initWithLabel:label value:(id)value reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [control handleControlEvents:UIControlEventValueChanged withBlock:actionBlock];
    }
    return self;
}

- (id)initWithLabel:(NSString *)label integerValue:(NSInteger)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    return [self initWithLabel:label value:@(value) reuseIdentifier:reuseIdentifier andBlock:actionBlock];
}

#pragma mark - Value accessors

- (id)value
{
	return @(self.stepper.value);
}

- (void)setValue:(id)aValue
{
	self.stepper.value = [aValue doubleValue];
}

#pragma mark - Layout

- (void)updateLabel
{
    self.detailTextLabel.text = [NSString stringWithFormat:@"%.0lf", self.stepper.value];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect labelFrame = self.textLabel.frame;
    labelFrame = CGRectMake(10, 11, labelFrame.size.width, labelFrame.size.height);
    self.textLabel.frame = labelFrame;
    self.detailTextLabel.frame = CGRectMake(labelFrame.size.width > 0 ? labelFrame.size.width + 20 : 10, 13, self.frame.size.width - labelFrame.size.width - self.stepper.frame.size.width - 50, 21);
	control.frame = CGRectMake(198, 8, 0, 0);
    [self addSubview:self.detailTextLabel];
}

@end
