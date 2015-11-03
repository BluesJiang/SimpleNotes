//
//  SearchNav.m
//  SimpleNotes
//
//  Created by BluesJiang on 2/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import "SearchNav.h"

@interface SearchNav ()

@end

@implementation SearchNav

- (void)viewDidLoad {
    [super viewDidLoad];
    SearchResultVC *searchResultVC = [[SearchResultVC alloc] init];
    [self pushViewController:searchResultVC animated:NO];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
