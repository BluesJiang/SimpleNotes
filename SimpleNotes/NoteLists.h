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


@interface NoteLists : UIViewController <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
@property(nonatomic,retain)   NSMutableArray* data;
@property (nonatomic,strong) UITableView * noteLists;
@property (nonatomic,strong) dataBase* dataBase;

- (void) loadData;
@end
