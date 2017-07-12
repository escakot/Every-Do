//
//  TodoTableViewCell.m
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "TodoTableViewCell.h"

static NSString *reuseIdentifier = @"todoCell";

@implementation TodoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    UIColor *color = self.priorityView.backgroundColor;
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected){
        self.priorityView.backgroundColor = color;
    }
}

-(void)updateDisplay{
    if (self.todo.isCompleted){
        NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:self.todo.title];
        [attributedTitle addAttribute:NSStrikethroughStyleAttributeName
                                 value:@1
                                 range:NSMakeRange(0, attributedTitle.length)];
        self.titleLabel.attributedText = attributedTitle;
        NSMutableAttributedString *attributedDescription = [[NSMutableAttributedString alloc] initWithString:self.todo.todoDescription];
        [attributedDescription addAttribute:NSBaselineOffsetAttributeName
                                      value:@0
                                      range:NSMakeRange(0, attributedDescription.length)];
        [attributedDescription addAttribute:NSStrikethroughStyleAttributeName
                                 value:@1
                                 range:NSMakeRange(0, attributedDescription.length)];
        self.todoDescriptionLabel.attributedText = attributedDescription;
    } else {
        self.titleLabel.text = self.todo.title;
        self.todoDescriptionLabel.text = self.todo.todoDescription;
    }
    //Priority color
    NSArray<UIColor*>* priorityColors = self.todo.priorityColors;
    self.priorityView.backgroundColor = priorityColors[self.todo.priority];
    self.priorityView.layer.cornerRadius = 30/2;
    
    //Deadline Date
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    unsigned dateFlags = NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComps = [gregorian components:dateFlags fromDate:self.todo.deadline];
    NSDate *dateOnly = [gregorian dateFromComponents:dateComps];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateFormat:@"MMM dd"];
    self.deadlineLabel.text = [formatter stringFromDate:dateOnly];
}

@end
