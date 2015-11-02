//
//  NoteListsCell.h
//  SimpleNotes
//
//  Created by BluesJiang on 1/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataBase.h"

@interface NoteListsCell : UITableViewCell
@property UILabel* timeLabel;
- (void) setTime:(NSDate*) date;
- (void) setContentAtRow:(NSInteger) row;


@end
