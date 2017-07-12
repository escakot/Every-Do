//
//  DetailViewController.m
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *deadlineLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *priorityView;
@property (weak, nonatomic) IBOutlet UILabel *deadlineTimeLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
//        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if ([self.detailItem isKindOfClass:NSClassFromString(@"Todo")]) {
        Todo *todoDetail = self.detailItem;
        self.title = todoDetail.title;
        self.detailDescriptionLabel.text = todoDetail.todoDescription;
        NSArray *priorityColors = todoDetail.priorityColors;
        self.priorityView.backgroundColor = priorityColors[todoDetail.priority];
        self.priorityView.layer.cornerRadius = self.priorityView.bounds.size.width/2;
        
        //Deadline Date
        NSCalendar *gregorian = [NSCalendar currentCalendar];
        unsigned dateFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSDateComponents *dateComps = [gregorian components:dateFlags fromDate:todoDetail.deadline];
        NSDate *dateOnly = [gregorian dateFromComponents:dateComps];
        dateFlags = NSCalendarUnitHour | NSCalendarUnitMinute;
        dateComps = [gregorian components:dateFlags fromDate:todoDetail.deadline];
        NSDate *timeOnly = [gregorian dateFromComponents:dateComps];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterLongStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        self.deadlineLabel.text = [formatter stringFromDate:dateOnly];
        [formatter setDateFormat:@"HH:mm"];
        self.deadlineTimeLabel.text = [formatter stringFromDate:timeOnly];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
//    self.priorityView.b
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
