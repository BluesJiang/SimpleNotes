//
//  NotesSearchVC.h
//  SimpleNotes
//
//  Created by BluesJiang on 2/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultVC.h"
#import "TextEditingView.h"

@interface NotesSearchVC : UISearchController<UISearchBarDelegate,UISearchControllerDelegate,UINavigationControllerDelegate>

@property dataBase* dataBase;
@end
