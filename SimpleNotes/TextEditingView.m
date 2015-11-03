//
//  TextEditingView.m
//  
//
//  Created by BluesJiang on 24/10/15.
//
//

#import "TextEditingView.h"
#define MyColor1 [[UIColor alloc] initWithRed:(219.0/255) green:213.0/255 blue:188.0/255 alpha:1]
#define MyColor2 [[UIColor alloc] initWithRed:(211.0/255) green:208.0/255 blue:172.0/255 alpha:1]
@interface TextEditingView ()
{
    UITextView* _mainTextView;
    UITextField* _titleTextView;
    NSMutableArray *_totalData;
    NSMutableDictionary *_currentData;
    BOOL _contentChanged;
}
@property BOOL keyboardShown;


@end

@implementation TextEditingView

- (TextEditingView *) initWithFlag:(NSInteger) flag
{
    if(self = [super init])
        _flag = flag;
    return self;
    
}


- (void) registerForKeyboardNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void) keyboardWasShown:(NSNotification*) aNotification{
    if(_keyboardShown)
        return;
    NSDictionary* info = [aNotification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey ];
    CGSize keyboardSize = [aValue CGRectValue].size;
    CGRect mainTextviewFrame = _mainTextView.frame;
    mainTextviewFrame.size.height -= (keyboardSize.height*7/5);
    _mainTextView.frame = mainTextviewFrame;
    _keyboardShown = YES;
    
    
}

- (void) keyboardWasHidden:(NSNotification*) aNotification{
    NSDictionary *info = [aNotification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey ];
    CGSize keyboardSize = [aValue CGRectValue].size;
    CGRect mainTextViewFrame = _mainTextView.frame;
    mainTextViewFrame.size.height += (keyboardSize.height*7/5);
    _mainTextView.frame = mainTextViewFrame;
    _keyboardShown = NO;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForKeyboardNotification];
    
    self.navigationController.navigationBar.backgroundColor = MyColor2;
    self.view.backgroundColor = MyColor1;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finishedEditing)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    

    
    
    _titleTextView = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, [[UIApplication sharedApplication] statusBarFrame].size.height+self.view.frame.origin.y+self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, 60)];
        _titleTextView.placeholder = @"请输入标题";
    _titleTextView.borderStyle = UITextBorderStyleRoundedRect;
    _titleTextView.backgroundColor = MyColor2;
    _titleTextView.delegate = self;
    _titleTextView.font = [UIFont fontWithName:@"AppleGothic" size:25];
    [self.view addSubview:_titleTextView];
    
    
    _mainTextView = [[UITextView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,_titleTextView.frame.size.height+_titleTextView.frame.origin.y, self.view.bounds.size.width, self.view.frame.size.height-_titleTextView.frame.size.height)];
    _mainTextView.backgroundColor = MyColor1;
    _mainTextView.delegate = self;
    _mainTextView.font = [UIFont fontWithName:@"AppleGothic" size:19];
    
    
    [self.view addSubview:_mainTextView];
    
    
    
    
    
   // NSString *path = [[NSBundle mainBundle] pathForResource:@"NotesData" ofType:@"plist"];
  //  _totalData = [[NSMutableArray alloc] initWithContentsOfFile:path];
    //NSLog(@"%@",_totalData);
    
    _dataBase = [dataBase getDataBase];
    
    
    if(_flag >= 0)
    {
        _currentData = [_dataBase.totalData objectAtIndex:_flag];
        _mainTextView.text = [_currentData objectForKey:@"content"];
        _titleTextView.text = [_currentData objectForKey:@"title"];
    }
    else
    {
        _currentData = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"title",@"",@"content", nil];
    }
    
    
    _contentChanged = NO;
    
    
    
    //[self registerForKeyboardNotification];
    
    
    
    // Do any additional setup after loading the view.
}

//TextField methol
- (void) textFieldDidEndEditing:(UITextField *)textField
{
    if([textField.text isEqualToString:[_currentData objectForKey:@"title"]] == NO)
    {
        [_currentData setObject:textField.text forKey:@"title"];
        _contentChanged = YES;
    }
    
}









//Text View Delegete methol

- (void) finishedEditing
{
    [_mainTextView resignFirstResponder];
    [_titleTextView resignFirstResponder];    
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
}




- (void)textViewDidEndEditing:(UITextView *)textView
{
    if( ![textView.text isEqualToString:[_currentData objectForKey:@"content"]])
    {
        [_currentData setObject:textView.text forKey:@"content"];
        _contentChanged = YES;
        
    }
    

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

- (void) viewWillDisappear:(BOOL)animated
{
    [_mainTextView resignFirstResponder];
    [_titleTextView resignFirstResponder];
    if(_contentChanged)
    {
        if(_flag>=0)
            [_dataBase.totalData removeObjectAtIndex:_flag];
        NSDate *date = [NSDate date];
        [_currentData setObject:date forKey:@"time"];
        
        
        //if([_titleTextView.text isEqualToString:@""])_titleTextView = @""
        //NSDictionary *dic = [[NSDictionary alloc] initWithObjects:  [NSArray arrayWithObjects:[NSNumber numberWithInt:_flag],[NSString stringWithFormat:@"%@",_titleTextView.text],textView.text,nil] forKeys: @[@"flag",@"title",@"content"]];
        
        [_dataBase.totalData insertObject:(NSDictionary*)_currentData atIndex:0];
        // NSString *path = [[NSBundle mainBundle] pathForResource:@"NotesData" ofType:@"plist"];
        //BOOL success = [_dataBase.totalData writeToFile:path atomically:YES];
        //NSLog(@"%d",success);
        
        [_dataBase saveData];
        _contentChanged = NO;
    }
    

}

@end
