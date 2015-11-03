//
//  NoteLists.h
//  
//
//  Created by BluesJiang on 24/10/15.
//
//

#import <UIKit/UIKit.h>
#import "TextEditingView.h"
#import "dataBase.h"
#import "NoteListsCell.h"
#import "NotesSearchVC.h"
#import "SearchResultVC.h"
#import "SearchNav.h"


@interface NoteLists : UIViewController <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UISearchControllerDelegate>
@property(nonatomic,retain)   NSMutableArray* data;
@property (nonatomic,strong) UITableView * noteLists;
@property (nonatomic,strong) dataBase* dataBase;

- (void) loadData;
@end
