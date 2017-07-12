//
//  Todo.m
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)init
{
    self = [super init];
    if (self){
        _deadline = [NSDate date];
        _isCompleted = NO;
        _priorityColors = @[[UIColor greenColor], [UIColor yellowColor], [UIColor orangeColor], [UIColor redColor]];
    }
    return self;
}

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)todoDescription priority:(NSInteger)priority{
    self = [super init];
    if (self){
        _title = title;
        _todoDescription = todoDescription;
        _priority = priority;
        _deadline = [NSDate date];
        _isCompleted = NO;
        _priorityColors = @[[UIColor greenColor], [UIColor yellowColor], [UIColor orangeColor], [UIColor redColor]]; 
    }
    return self;
}
@end
