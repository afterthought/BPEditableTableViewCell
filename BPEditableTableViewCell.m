//
//  BPEditableTableViewCell.m
//  Brewtool
//
//  Created by Jon Olson on 10/14/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "BPEditableTableViewCell.h"

@interface BPEditableTableViewCell (Private)

+ (Class)controlClass;

@end

@implementation BPEditableTableViewCell

#pragma mark -
#pragma mark Construction and deallocation

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _doInit];
    }
    return self;
}
- (void)_doInit {
    Class controlClass = [[self class] controlClass];
    control = [[controlClass alloc] initWithFrame:CGRectZero];
    control.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [control addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.contentView addSubview:control];
    [self setNeedsLayout];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
 	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self _doInit];
    }
    return self;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
	return [self initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
}

- (id)initWithLabel:(NSString *)label reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [self initWithReuseIdentifier:reuseIdentifier]) {
		self.textLabel.text = label;
	}
	
	return self;
}


#pragma mark -
#pragma mark Accessors

@synthesize delegate;
@synthesize disabledWhenNotEditing;

#pragma mark -
#pragma mark Value accessor stubs

- (id)value {
	return nil;
}

- (void)setValue:(id)aValue {
	return;
}

#pragma mark -
#pragma mark Editing



#pragma mark -
#pragma mark Control accessor

- (UIControl *)control {
	return control;
}

#pragma mark -
#pragma mark Layout enforcement

- (void)layoutSubviews {
	[super layoutSubviews];
	CGRect labelFrame = self.textLabel.frame;
	labelFrame = CGRectMake(10, 11, labelFrame.size.width, labelFrame.size.height);
	self.textLabel.frame = labelFrame;
	self.control.frame = CGRectMake(labelFrame.size.width > 0 ? labelFrame.size.width + 20 : 10, 13, self.frame.size.width - labelFrame.size.width - 45, 21);
	[self.detailTextLabel removeFromSuperview];
}

#pragma mark -
#pragma mark Value changes

- (IBAction)valueChanged:(UIControl *)sender {
    if ([delegate respondsToSelector:@selector(editableTableViewCell:didUpdateValue:)])
        [delegate editableTableViewCell:self didUpdateValue:self.value];
}

@end
