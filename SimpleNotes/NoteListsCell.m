//
//  NoteListsCell.m
//  SimpleNotes
//
//  Created by BluesJiang on 1/11/15.
//  Copyright © 2015年 BluesJiang. All rights reserved.
//

#import "NoteListsCell.h"
#define TextColor [[UIColor alloc] initWithRed:139.0/255 green:139.0/255 blue:1.0/255 alpha:1]

@implementation NoteListsCell


- (void)awakeFromNib {
    // Initialization code
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _timeLabel =[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-50, self.textLabel.frame.origin.y+16, 88, 10)];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.textColor = TextColor;
        _timeLabel.font = [UIFont  systemFontOfSize:10];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_timeLabel];
        self.textLabel.font = [UIFont fontWithName:@"AppleGothic" size:[UIFont systemFontSize]];
        self.detailTextLabel.font =[UIFont fontWithName:@"AppleGothic" size:[UIFont systemFontSize]];;
    }
    return self;
}

- (void) setTime:(NSDate*) date
{
    NSDate* currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if([[date dateByAddingTimeInterval:24*60*60] compare:currentDate] == NSOrderedAscending)
    {
        [formatter setDateFormat:@"MM/dd hh:mm"];
    }
    else
    {
        [formatter setDateFormat:@"hh:mm:ss"];
    }
    _timeLabel.text = [formatter stringFromDate:date];
        
}

- (void) setContentAtRow:(NSInteger) row
{
    dataBase *data ;
    data = [dataBase getDataBase];
    self.textLabel.text = [NSString stringWithFormat:@"%@",[[data.totalData objectAtIndex:row] objectForKey:@"title"]];
    self.detailTextLabel.text = [NSString stringWithFormat:@"%@",[[data.totalData objectAtIndex:row] objectForKey:@"content"]];
    [self setTime:[[data.totalData objectAtIndex:row] objectForKey:@"time"]];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
