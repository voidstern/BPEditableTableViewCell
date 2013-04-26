//
//  BPEditableTableViewCell.h
//  Brewtool
//
//  Created by Jon Olson on 10/14/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIControl+ALActionBlocks.h"
#import "VSCStyledGroupedTableViewCell.h"

@interface BPEditableTableViewCell : VSCStyledGroupedTableViewCell
{
	UIControl *control;
}

@property (readonly) UIControl *control;
@property (assign) BOOL disabledWhenNotEditing;
@property (copy) id value;

@property (assign) id delegate;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (id)initWithLabel:(NSString *)label reuseIdentifier:(NSString *)reuseIdentifier;
- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier;
- (id)initWithLabel:(NSString *)label value:(id)value reuseIdentifier:(NSString *)reuseIdentifier andBlock:(ActionBlock)actionBlock;

@end

@interface NSObject (BPEditableTableViewCellDelegate)

- (void)editableTableViewCell:(BPEditableTableViewCell *)cell didUpdateValue:(id)value;
- (BOOL)editableTableViewCellShouldReturn:(BPEditableTableViewCell *)cell;

@end

