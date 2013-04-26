//
//  BPBrightnessEditableTableViewCell.m
//
//  Created by Jon Olson on 7/29/10.
//  Copyright 2010 Ballistic Pigeon, LLC. All rights reserved.
//

#import "BPSliderEditableTableViewCell.h"

@implementation BPSliderEditableTableViewCell

+ (Class)controlClass
{
    return [UISlider class];
}

#pragma mark - Construction and deallocation

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {        
        [control addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        [control addTarget:self action:@selector(updateLabel) forControlEvents:UIControlEventValueChanged];
        self.detailTextLabel.text = @"";
    }
    
    return self;
}

- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [self initWithLabel:label reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.slider.value = [value floatValue];
        [self updateLabel];
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

- (id)initWithLabel:(NSString *)label floatValue:(float)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock
{
    self = [self initWithLabel:label value:@(value) reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [control handleControlEvents:UIControlEventValueChanged withBlock:actionBlock];
    }
    return self;
}

#pragma mark - Accessors

- (UISlider *)slider
{
    return (UISlider *)self.control;
}

#pragma mark - Layout

- (void)updateLabel
{
    self.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", self.slider.value];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect labelFrame = self.textLabel.frame;
    labelFrame = CGRectMake(10, 11, labelFrame.size.width, labelFrame.size.height);
    self.textLabel.frame = labelFrame;

    CGFloat detailOffset = self.textLabel.frame.size.width + self.textLabel.frame.origin.x;
    self.detailTextLabel.frame = CGRectMake(detailOffset > 0 ? detailOffset + 10 : 10, self.textLabel.frame.origin.y, 25, self.textLabel.frame.size.height);

    CGFloat controlOffset = self.detailTextLabel.frame.size.width + self.detailTextLabel.frame.origin.x;
    self.control.frame = CGRectMake(controlOffset > 0 ? controlOffset + 10 : 10, 0, self.bounds.size.width - (controlOffset + 40), self.bounds.size.height);
}

@end
