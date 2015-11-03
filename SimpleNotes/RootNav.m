//
//  RootNav.m
//  
//
//  Created by BluesJiang on 24/10/15.
//
//

#import "RootNav.h"
#import "NoteLists.h"
#import "TextEditingView.h"
#define MyColor1 [[UIColor alloc] initWithRed:(219.0/255) green:213.0/255 blue:188.0/255 alpha:1]
#define MyColor2 [[UIColor alloc] initWithRed:(211.0/255) green:208.0/255 blue:172.0/255 alpha:1]
#define TextColor [[UIColor alloc] initWithRed:139.0/255 green:139.0/255 blue:1.0/255 alpha:1]


@interface RootNav ()
{
    NoteLists* _noteLists;
}

@property (nonatomic) dataBase *dataBase;

@end

@implementation RootNav

- (void)viewDidLoad {
    [super viewDidLoad];
    _noteLists = [[NoteLists alloc] init];
    self.delegate = self;
    _dataBase = [dataBase getDataBase];
    [self pushViewController:_noteLists animated:NO];
    self.view.tintColor = TextColor;
    NSLog(@"%@",self);
    
    
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    

    
    
    
    
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
