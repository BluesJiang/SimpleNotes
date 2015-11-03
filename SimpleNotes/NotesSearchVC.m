//
//  NotesSearchVC.m
//  SimpleNotes
//
//  Created by BluesJiang on 2/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import "NotesSearchVC.h"
#define TextColor [[UIColor alloc] initWithRed:139.0/255 green:139.0/255 blue:1.0/255 alpha:1]

@interface NotesSearchVC ()

@end

@implementation NotesSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    _dataBase = [dataBase getDataBase];
    self.searchBar.delegate = self;
    [(UINavigationController*)self.searchResultsController setDelegate:self];
    self.searchBar.tintColor = TextColor;
        
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// SearchBar Delegate

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(_dataBase.searchResult){[_dataBase.searchResult removeAllObjects];_dataBase.searchResult = nil;}
    
        _dataBase.searchResult = [[NSMutableArray alloc] init];
        for(int i=0;i<_dataBase.totalData.count;i++)
        {
            NSDictionary *dic = [_dataBase.totalData objectAtIndex:i];
            NSRange range1,range2;
            range1 = [[dic objectForKey:@"title"] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            range2 = [[dic objectForKey:@"content"] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(!(range1.location == NSNotFound && range2.location == NSNotFound))
            {
                [_dataBase.searchResult addObject:[[NSNumber alloc] initWithInt:i]];
            }
            
        }
    SearchResultVC *result= [[SearchResultVC alloc] init];
    [(UINavigationController *)self.searchResultsController pushViewController:result animated:NO];
   // [(SearchResultVC*) self.searchResultsController reloadData];
    //[self.navigationController pushViewController:self.searchResultsController animated:NO];
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //[searchBar setShowsCancelButton:YES animated:YES];
    // [_noteLists reloadData];
}


- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    if(![searchBar.text isEqualToString:@""])
    {
        searchBar.text = @"";
    }
    
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    
    
    
    
    
}


- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if([viewController isKindOfClass:[TextEditingView class]])
    {
        [self.searchBar setHidden:YES];
    }
    if([viewController isKindOfClass:[SearchResultVC class]])
    {
        [self.searchBar setHidden:NO];
    }
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
