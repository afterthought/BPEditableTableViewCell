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

@property (weak, readonly) UISwitch *switchControl;

@end
