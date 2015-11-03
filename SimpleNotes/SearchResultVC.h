//
//  SearchResultVC.h
//  SimpleNotes
//
//  Created by BluesJiang on 2/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataBase.h"
#import "NoteListsCell.h"
#import "TextEditingView.h"

@interface SearchResultVC : UITableViewController
@property dataBase* dataBase;
- (void) reloadData;


@end
