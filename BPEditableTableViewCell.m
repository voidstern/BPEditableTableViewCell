//
//  BPEditableTableViewCell.m
//
//  Created by Jon Olson on 10/14/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "BPEditableTableViewCell.h"

@interface BPEditableTableViewCell (Private)

+ (Class)controlClass;

@end

@implementation BPEditableTableViewCell

#pragma mark - Construction and deallocation

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier])
    {
		Class controlClass = [[self class] controlClass];
		control = [[controlClass alloc] initWithFrame:CGRectZero];
		control.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
		[self.contentView addSubview:control];
		[self setNeedsLayout];
	}
	
	return self;
}

- (id)initWithLabel:(NSString *)label reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [self initWithReuseIdentifier:reuseIdentifier])
    {
		self.textLabel.text = label;
	}
	
	return self;
}


- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [self initWithLabel:label reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // In Subclasses
    }
    return self;
}


- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    self = [self initWithLabel:label value:(id)value reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // In Subclasses
    }
    return self;
}

#pragma mark - Value accessor stubs

- (id)value
{
	return nil;
}

- (void)setValue:(id)aValue
{
	return;
}

#pragma mark - Editing

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
	[self control].enabled = !self.disabledWhenNotEditing || editing;
}

#pragma mark - Control accessor

- (UIControl *)control
{
	return control;
}

#pragma mark - Layout enforcement

- (void)layoutSubviews
{
	[super layoutSubviews];
	CGRect labelFrame = self.textLabel.frame;
	labelFrame = CGRectMake(10, 11, labelFrame.size.width, labelFrame.size.height);
	self.textLabel.frame = labelFrame;
	self.control.frame = CGRectMake(labelFrame.size.width > 0 ? labelFrame.size.width + 20 : 10, 13, self.frame.size.width - labelFrame.size.width - 45, 21);
}

#pragma mark - Value changes

- (IBAction)valueChanged:(UIControl *)sender
{
    if ([self.delegate respondsToSelector:@selector(editableTableViewCell:didUpdateValue:)])
    {
        [self.delegate editableTableViewCell:self didUpdateValue:self.value];
    }
}

@end
