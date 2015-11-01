//
//  NoteLists.m
//  
//
//  Created by BluesJiang on 24/10/15.
//
//

#import "NoteLists.h"
#define MyColor1 [[UIColor alloc] initWithRed:(219.0/255) green:213.0/255 blue:188.0/255 alpha:1]
#define MyColor2 [[UIColor alloc] initWithRed:(210.0/255) green:192.0/255 blue:122.0/255 alpha:1]

@interface NoteLists ()
{
    
}

@property BOOL trashButtonPushed;
@property NSInteger numberOfRow;
@property UISearchBar *searchBar;
@property NSMutableArray *searchList;
//@property UISearchDisplayController* searchDisplayController;
@property BOOL searchStatus;

@end

@implementation NoteLists

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.view.tintColor = MyColor1;
    self.title = @"Notes List";
    
   // _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar  contentsController:_noteLists];
    
    //设置搜索栏
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, 45)];
    [self.view addSubview:_searchBar];
    _searchBar.placeholder = @"搜索";
    //_searchBar.prompt = @"搜索文本";
    _searchBar.barStyle = UIBarStyleDefault;
   // _searchBar.showsCancelButton = YES;
    _searchBar.showsScopeBar = YES;
    //_searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"singer",@"song",@"album", nil];
    _searchBar.delegate = self;
    
    
    //设置表单
    
    _noteLists = [[UITableView alloc] initWithFrame:CGRectMake(0, _searchBar.frame.origin.y+_searchBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _noteLists.backgroundColor = MyColor2;
    
    [_noteLists setDelegate:self];
    [_noteLists setDataSource:self];
    CGRect theRect = self.view.frame;
    theRect.size.height -= 60*3;
    UIView * newFooterView = [[UIView alloc] initWithFrame:self.view.frame];
    newFooterView.backgroundColor = MyColor1;
    //  newFooterView.backgroundColor = [UIColor whiteColor];
    _noteLists.tableFooterView = newFooterView;
    
    //设置导航栏
    
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightTopButtonPushed)];
    self.navigationItem.rightBarButtonItem = addButton;
    UIBarButtonItem * trashButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self  action:@selector(trashButtonPushed)];
    self.navigationItem.leftBarButtonItem = trashButton;
    
    
    
    self.navigationController.navigationBar.backgroundColor = MyColor1;
    [self.view addSubview:_noteLists];
    self.numberOfRow = 20;
    
    //内容初始化
    _searchStatus = NO;
    _trashButtonPushed = NO;
    NSLog(@"%@",self.navigationController);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_searchStatus)
        return _searchList.count;
    else
        return _dataBase.totalData.count;

}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * dequeueID = @"NotesTitle";
    NoteListsCell * cell = [tableView dequeueReusableCellWithIdentifier:dequeueID];
    
    if(cell == nil)
    {
        cell = [[NoteListsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:dequeueID];
        
        
        
    }
    NSInteger row = [indexPath row];
    if(row%2 == 1)
        cell.backgroundColor = MyColor1;
    else
        cell.backgroundColor = MyColor2;
    if(_searchStatus)
    {
        [cell setContent:_searchList forRow:row];
    }
    else
    {
        [cell setContent:_dataBase.totalData forRow:row];
    }
    NSLog(@"I Creat the number %d row\n",(int)row);
        
    
    
    return cell;
    
    
    
    
    
}



- (void) rightTopButtonPushed
{
    
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    /*if(_addButtonPushed == NO)
    {_addButtonPushed = YES;
        [_noteLists setEditing:YES animated:YES];
    }
    else
    {
        [_noteLists setEditing:NO animated:YES];
        _addButtonPushed = NO;
        
    }*/
   
    TextEditingView *newTex = [[TextEditingView alloc] initWithFlag:-1];
            //newTex.flag = -1;
        //NSLog(@"%@",self.navigationController);
    [self.navigationController pushViewController:newTex animated:YES];
    
    
    
}

- (void) trashButtonPushed
{
    [_noteLists setEditing:YES animated:YES];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPushed)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
}

- (void) doneButtonPushed
{
    [_noteLists setEditing:NO animated:YES];
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightTopButtonPushed)];
    self.navigationItem.rightBarButtonItem = addButton;

    
}


- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleDelete;
}




//Delegate Methol


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"%@",indexPath);
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        [_dataBase.totalData removeObjectAtIndex:indexPath.row];
        NSLog(@"%@",_dataBase.totalData);
        //NSString *path = [[NSBundle mainBundle] pathForResource:@"NotesData" ofType:@"plist"];
        //[_data writeToFile:path atomically:YES];
        [_dataBase saveData];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
                //[_noteLists reloadData];
       // [self loadData];
        NSLog(@"%@",_dataBase.totalData);
    }
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld -> %d\n",(long)indexPath.section,(int)indexPath.row);
    TextEditingView *newTex = [[TextEditingView alloc] initWithFlag:indexPath.row];
   // newTex.flag = indexPath.row;
    [self.navigationController pushViewController:newTex animated:YES];
   // NSLog(@"%@",self);
    
}



//数据录入

- (void) loadData
{
    /*dataType *temp1 = [[dataType alloc] initWithTitle:@"title1" andContent:@"1111111"];
    dataType *temp2 = [[dataType alloc] initWithTitle:@"title2" andContent:@"2222222"];
    dataType *temp3 = [[dataType alloc] initWithTitle:@"title3" andContent:@"3333333"];
    dataType *temp4 = [[dataType alloc] initWithTitle:@"title4" andContent:@"4444444"];
    dataType *temp5 = [[dataType alloc] initWithTitle:@"title5" andContent:@"5555555"];
    dataType *temp6 = [[dataType alloc] initWithTitle:@"title6" andContent:@"6666666"];
    dataType *temp7 = [[dataType alloc] initWithTitle:@"title7" andContent:@"7777777"];
    dataType *temp8 = [[dataType alloc] initWithTitle:@"title8" andContent:@"8888888"];
    dataType *temp9 = [[dataType alloc] initWithTitle:@"title9" andContent:@"9999999"];
    dataType *temp10 = [[dataType alloc] initWithTitle:@"title10" andContent:@"AAAAAAA"];
    dataType *temp11 = [[dataType alloc] initWithTitle:@"title11" andContent:@"BBBBBBB"];
    dataType *temp12 = [[dataType alloc] initWithTitle:@"title12" andContent:@"CCCCCCC"];
    
    _data = [NSMutableArray arrayWithObjects:temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12, nil];*/
   if(_dataBase == nil)
       _dataBase = [dataBase getDataBase];
    
    
}

// SearchBar Delegate

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    _searchStatus = YES;
    if(_searchList){[_searchList removeAllObjects];_searchList = nil;}
    if([searchText isEqualToString:@""])_searchStatus = NO;
    if(_searchStatus)
    {
        _searchList= [[NSMutableArray alloc] init];
        for(int i=0;i<_dataBase.totalData.count;i++)
        {
            NSDictionary *dic = [_dataBase.totalData objectAtIndex:i];
            NSRange range1,range2;
            range1 = [[dic objectForKey:@"title"] rangeOfString:searchText];
            range2 = [[dic objectForKey:@"content"] rangeOfString:searchText];
            if(!(range1.location == NSNotFound && range2.location == NSNotFound))
            {
                [_searchList addObject:[_dataBase.totalData objectAtIndex:i]];
            }
            
        }
 
    }
    
    [_noteLists reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    _searchStatus = YES;
    // [_noteLists reloadData];
}


- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    _searchStatus = NO;
    if(![searchBar.text isEqualToString:@""])
    {
        [_noteLists reloadData];
        searchBar.text = @"";
    }
    
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    if([searchBar.text isEqualToString:@""]) _searchStatus = NO;
    
    

    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
