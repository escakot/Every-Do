//
//  Todo.m
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)todoDescription priority:(NSInteger)priority{
    self = [super init];
    if (self){
        _title = title;
        _todoDescription = todoDescription;
        _priority = priority;
        _isCompleted = NO;
    }
    return self;
}
@end
