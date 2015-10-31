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
#define MyColor2 [[UIColor alloc] initWithRed:(210.0/255) green:192.0/255 blue:122.0/255 alpha:1]

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
    self.view.tintColor = MyColor2;
    NSLog(@"%@",self);
    
    
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if([viewController isKindOfClass:[NoteLists class]])
    {
        //NSInteger num = _noteLists.data.count;
        //[_noteLists loadData];
        NSLog(@"%@",_noteLists.data);
//        if (_dataBase.dataIncreased) {
//            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//            //[_noteLists.noteLists beginUpdates];
//            //[_noteLists.noteLists setEditing:YES];
//            
//            [_noteLists.noteLists insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
//            _dataBase.dataIncreased = NO;
//        }
        [_noteLists.noteLists reloadData];
        //[_noteLists.noteLists reloadData];
        // [_noteLists.noteLists setEditing:NO];
    }
    

    
    
    
    
}
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    if ([viewController isKindOfClass:[NoteLists class]]) {
//        NSInteger num = _noteLists.data.count;
//        [_noteLists loadData];
//        NSLog(@"%@",_noteLists.data);
//        if (num < _noteLists.data.count) {
//            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//            //[_noteLists.noteLists beginUpdates];
//            //[_noteLists.noteLists setEditing:YES];
//            [_noteLists.noteLists insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
//            
//        }
//        [_noteLists.noteLists reloadData];
//        //[_noteLists.noteLists reloadData];
//        // [_noteLists.noteLists setEditing:NO];
//    }
//}


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
