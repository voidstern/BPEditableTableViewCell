//
//  BPTextFieldEditableTableViewCell.m
//  Brewtool//
//  Created by Jon Olson on 10/14/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "BPTextFieldEditableTableViewCell.h"


@implementation BPTextFieldEditableTableViewCell

+ (Class)controlClass
{
	return [UITextField class];
}

#pragma mark - Construction and deallocation

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
		self.textField.textColor = [UIColor colorWithRed:0.22 green:0.33 blue:0.53 alpha:1];
		self.textField.font = [UIFont systemFontOfSize:15.0];
		self.textField.delegate = self;
        
        [control addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
	}
	
	return self;
}

- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [self initWithLabel:label reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.textField.text = value;
    }
    return self;
}

- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    self = [self initWithLabel:label value:value reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [control handleControlEvents:UIControlEventValueChanged withBlock:actionBlock];
    }
    return self;
}

- (id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(id)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    self = [self initWithLabel:label value:value reuseIdentifier:reuseIdentifier andBlock:actionBlock];
    if (self)
    {
		self.textField.placeholder = placeholder;
    }
    return self;
}

#pragma mark - Control accessor

- (UITextField *)textField
{
	return (UITextField *)self.control;
}

#pragma mark - Value accessors

- (id)value
{
	return self.textField.text;
}

- (void)setValue:(id)aValue
{
	self.textField.text = aValue;
}

#pragma mark - UITextFieldDelegate implementation

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [control invokeBlocks];

	if ([self.delegate respondsToSelector:@selector(editableTableViewCellShouldReturn:)])
    {
		return [self.delegate editableTableViewCellShouldReturn:self];
    }
	return YES;
}

#pragma mark - Layout

- (void)layoutSubviews
{
	[super layoutSubviews];
    [self.detailTextLabel removeFromSuperview];
}

@end
