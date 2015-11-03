//
//  SearchResultVC.m
//  SimpleNotes
//
//  Created by BluesJiang on 2/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import "SearchResultVC.h"
#define MyColor1 [[UIColor alloc] initWithRed:(219.0/255) green:213.0/255 blue:188.0/255 alpha:1]
#define MyColor2 [[UIColor alloc] initWithRed:(211.0/255) green:208.0/255 blue:172.0/255 alpha:1]
#define TextColor [[UIColor alloc] initWithRed:139.0/255 green:139.0/255 blue:1.0/255 alpha:1]

@interface SearchResultVC ()

@end

@implementation SearchResultVC

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataBase = [dataBase getDataBase];
    self.tableView.tableHeaderView = nil;
    self.tableView.backgroundColor = MyColor2;
    self.tableView.frame = self.view.frame;
    CGRect theRect = self.view.frame;
    theRect.size.height -= 60*3;
    UIView * newFooterView = [[UIView alloc] initWithFrame:self.view.frame];
    newFooterView.backgroundColor = MyColor1;
    //  newFooterView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = newFooterView;
    
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) reloadData
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataBase.searchResult.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * iden = @"SearchCell";
    NoteListsCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if(cell == nil)
    {
        cell = [[NoteListsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    }
    NSInteger row=indexPath.row;
    
    if(row%2 == 1)
        cell.backgroundColor = MyColor1;
    else
        cell.backgroundColor = MyColor2;
    
    [cell setContentAtRow:[[_dataBase.searchResult objectAtIndex:indexPath.row] integerValue]];
    
    
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataBase.totalData removeObjectAtIndex:[[_dataBase.searchResult objectAtIndex:indexPath.row] integerValue]];
        [_dataBase.searchResult removeObjectAtIndex:indexPath.row];
        [_dataBase saveData];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
        
        
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld -> %d\n",(long)indexPath.section,(int)indexPath.row);
    TextEditingView *newTex = [[TextEditingView alloc] initWithFlag:[[_dataBase.searchResult objectAtIndex:indexPath.row] integerValue]];
    // newTex.flag = indexPath.row;
//    UINavigationController *nac = [[UINavigationController alloc] init];
    NSLog(@"%@",self.navigationController);
    
    
    [self.navigationController pushViewController:newTex animated:YES];
    [self.tableView reloadData];
    
     NSLog(@"%@",self);
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void) viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
