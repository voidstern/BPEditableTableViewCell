//
//  BPSwitchEditableTableViewCell.h
//  Brewtool
//
//  Created by Jon Olson on 10/14/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPEditableTableViewCell.h"

@interface BPSwitchEditableTableViewCell : BPEditableTableViewCell {

}

@property (readonly) UISwitch *switchControl;

- (id)initWithLabel:(NSString *)label boolValue:(BOOL)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock;

@end
