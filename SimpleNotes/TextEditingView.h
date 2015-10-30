//
//  TextEditingView.h
//  
//
//  Created by BluesJiang on 24/10/15.
//
//

#import <UIKit/UIKit.h>
#import "dataBase.h"
#import "NoteLists.h"
@interface TextEditingView : UIViewController <UITextViewDelegate,UITextFieldDelegate>

@property NSInteger flag;
@property dataBase *dataBase;


- (TextEditingView *) initWithFlag:(NSInteger) flag;
@end
