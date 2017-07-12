//
//  AddTodoViewController.m
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIView *priorityView;
@property (strong, nonatomic) NSArray<UIColor*> *priorityColors;

@end

@implementation AddTodoViewController

- (IBAction)doneButton:(UIBarButtonItem*)sender {
    Todo *newTodo = [[Todo alloc] init];
    newTodo.title = self.titleTextField.text;
    newTodo.todoDescription = self.descriptionTextView.text;
    newTodo.priority = [self.priorityColors indexOfObject:self.priorityView.backgroundColor];
    newTodo.isCompleted = NO;
    [self.delegate saveNewTodo:newTodo];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.priorityColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor]];
    
    self.priorityView.backgroundColor = [UIColor greenColor];
    self.descriptionTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.descriptionTextView.layer.borderWidth = 1.0;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changePriorityColor:)];
    [self.priorityView addGestureRecognizer:tapGesture];
}

- (void)changePriorityColor:(UITapGestureRecognizer*)sender{
    NSUInteger newPriority = ([self.priorityColors indexOfObject:self.priorityView.backgroundColor] + 1) % self.priorityColors.count;
    
    self.priorityView.backgroundColor = self.priorityColors[newPriority];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
