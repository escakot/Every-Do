//
//  Todo.h
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *todoDescription;
@property (assign, nonatomic) NSInteger priority;
@property (assign, nonatomic) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)todoDescription priority:(NSInteger)priority;

@end
