//
//  dataBase.h
//  
//
//  Created by BluesJiang on 27/10/15.
//
//

#import <Foundation/Foundation.h>

@interface dataBase : NSObject

@property (nonatomic,strong) NSMutableArray* totalData;
@property (nonatomic) NSMutableArray* searchResult;
//@property BOOL dataIncreased;

- (void) initData;
+ (dataBase *) getDataBase;
- (void) saveData;
@end
