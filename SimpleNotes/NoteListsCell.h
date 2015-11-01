//
//  NoteListsCell.h
//  SimpleNotes
//
//  Created by BluesJiang on 1/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteListsCell : UITableViewCell
@property UILabel* timeLabel;
- (void) setTime:(NSDate*) date;
- (void) setContent:(NSArray*) arr forRow:(NSInteger) row;


@end
