//
//  Todo.h
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Todo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *todoDescription;
@property (assign, nonatomic) NSUInteger priority;
@property (strong, nonatomic) NSDate *deadline;
@property (assign, nonatomic) BOOL isCompleted;
@property (strong, nonatomic) NSArray<UIColor*> *priorityColors;

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)todoDescription priority:(NSInteger)priority;

@end
