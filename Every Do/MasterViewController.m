//
//  MasterViewController.m
//  Every Do
//
//  Created by Errol Cheong on 2017-07-11.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TodoTableViewCell.h"
#import "Todo.h"

@interface MasterViewController ()


@property (strong, nonatomic) IBOutlet UITableView *todoTableView;
@property NSMutableArray *objects;
@property (strong, nonatomic) NSMutableArray<Todo*> *todoList;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewTodo:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    //My Code t(=.=t)
//    self.todoTableView.tableFooterView = [[UIView alloc] init];
    self.todoList = [self setupTodos];
    [self.todoTableView reloadData];
    
    UISwipeGestureRecognizer* swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(deleteCell:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.todoTableView addGestureRecognizer:swipeGesture];
    self.todoTableView.userInteractionEnabled = YES;
    
}

- (NSMutableArray*)setupTodos{
    NSMutableArray *todoList = [[NSMutableArray alloc] init];
    Todo *todo1 = [[Todo alloc] initWithTitle:@"Get groceries"
                                  description:@"potatoes, carrots, celery, chicken, bread"
                                     priority:2];
    Todo *todo2 = [[Todo alloc] initWithTitle:@"Deliver mail"
                                  description:@"Deliver mail for a friend."
                                     priority:1];
    Todo *todo3 = [[Todo alloc] initWithTitle:@"Gym"
                                  description:@"Pull ups, bench press, squats, deadlifts"
                                     priority:3];
    Todo *todo4 = [[Todo alloc] initWithTitle:@"Homework"
                                  description:@"Lighthouse Labs Assignment W3D2"
                                     priority:0];
    [todoList addObject:todo1];
    [todoList addObject:todo2];
    [todoList addObject:todo3];
    [todoList addObject:todo4];
    return todoList;
}

- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewTodo:(id)sender {
    
    [self performSegueWithIdentifier:@"addTodoSegue" sender:nil];
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Add Todo Delegate

-(void) saveNewTodo:(Todo*)todo{
    [self.todoList addObject:todo];
    [self.todoTableView reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"todoDetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
        Todo *object = self.todoList[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.detailItem = object;
        [controller setDetailItem:object];
    }
    if ([[segue identifier] isEqualToString:@"addTodoSegue"]) {
        UINavigationController *navController = segue.destinationViewController;
        AddTodoViewController *addTodoController = navController.viewControllers[0];
        addTodoController.delegate = self;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"todoDetailSegue" sender:nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.objects.count;
    return self.todoList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    
    cell.todo = self.todoList[indexPath.row];
    [cell updateDisplay];
//    NSDate *object = self.objects[indexPath.row];
//    cell.textLabel.text = [object description];
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    id movingObject = self.todoList[sourceIndexPath.row];
    [self.todoList removeObjectAtIndex:sourceIndexPath.row];
    [self.todoList insertObject:movingObject atIndex:destinationIndexPath.row];
    [self.todoTableView reloadData];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

# pragma mark - Gesture Recognizers
- (void)deleteCell:(UISwipeGestureRecognizer*)sender{
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint swipeLocation = [sender locationInView:self.todoTableView];
        NSIndexPath *swipeIndexPath = [self.todoTableView indexPathForRowAtPoint:swipeLocation];
        NSLog(@"Swipe at %li!", swipeIndexPath.row);
        self.todoList[swipeIndexPath.row].isCompleted = !self.todoList[swipeIndexPath.row].isCompleted;
        [self.todoTableView reloadData];
    }
}


@end
