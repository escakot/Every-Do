//
//  AddTodoViewController.h
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddTodoViewControllerDelegate <NSObject>

-(void) saveNewTodo:(Todo*)todo;

@end

@interface AddTodoViewController : UIViewController

@property (weak, nonatomic) id <AddTodoViewControllerDelegate> delegate;

@end
