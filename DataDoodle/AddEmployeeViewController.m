//
//  AddEmployeeViewController.m
//  DataDoodle
//
//  Created by Eric Mentele on 6/21/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import "AddEmployeeViewController.h"

@interface AddEmployeeViewController ()
@property DevShop *devShop;

@end

@implementation AddEmployeeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.managedObjectContext = [[DevBizDataModel sharedDataModel]mainContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DevShop"];
    NSError *error;
    NSArray *results = [self.managedObjectContext executeFetchRequest: request error: &error];
    
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    self.devShop = results.firstObject;
}

- (IBAction)saveDeveloperPressed:(UIBarButtonItem *)sender {
    if (self.managedObjectContext) {
        NSLog(@"Context is ready!");
        
        Developer *dev = [NSEntityDescription insertNewObjectForEntityForName:@"Developer" inManagedObjectContext:self.managedObjectContext];
        dev.name = [self.employeeName text];
        
        [self.devShop addDevelopersObject: dev];
        
        NSError* error = nil;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Error: %@", error);
        }
    } else {
        NSLog(@"Context was nil :(");
    }
    
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
