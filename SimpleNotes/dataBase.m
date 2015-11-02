//
//  dataBase.m
//  
//
//  Created by BluesJiang on 27/10/15.
//
//

#import "dataBase.h"

@implementation dataBase

static dataBase * singleDataBase;

+ (dataBase*) getDataBase
{
    if(singleDataBase == nil)
        singleDataBase = [[dataBase alloc] init];
    
    return singleDataBase;
}

- (void) initData
{
    /*NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"Notes.plist"];*/
    NSString* path = NSHomeDirectory();
    NSString *fileName = [path stringByAppendingPathComponent:@"Documents/Notes.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"%@",fileName);
    
    if([fileManager fileExistsAtPath:fileName])
    {
        _totalData = [NSMutableArray arrayWithContentsOfFile:fileName];

    }
    else
    {
        _totalData = [[NSMutableArray alloc] init];
        [fileManager createFileAtPath:fileName contents:nil attributes:nil ];
    
    }

    
    

    
}



- (void) saveData
{
//    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString * documentsDirectory = [paths objectAtIndex:0];
//    NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"Notes.plist"];
    NSString* path = NSHomeDirectory();
    NSString *fileName = [path stringByAppendingPathComponent:@"Documents/Notes.plist"];

    NSLog(@"%@",fileName);
    [_totalData writeToFile:fileName atomically:YES];
}




- (id) init
{
    if(self = [super init])
    {
        [self initData];
    }
    return self;
}


@end
