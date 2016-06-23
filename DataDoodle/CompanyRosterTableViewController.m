// TODO: Add multiple with search bar. Show list of them. As you search company name use Predicate to Sort by name button, sort by number of developlers. Company list name and number of devs. Searchable by name and number of devs ascending descending. NSfetchresultscontroller and predicate focus. 

//  CompanyRosterTableViewController.m
//  DataDoodle
//
//  Created by Eric Mentele on 6/21/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import "CompanyRosterTableViewController.h"

@interface CompanyRosterTableViewController () <NSFetchedResultsControllerDelegate>

@property NSFetchedResultsController *fetchedResultsController;

@end

@implementation CompanyRosterTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.managedObjectContext = [[DevBizDataModel sharedDataModel] mainContext];
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName: @"DevShop"];
//    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"companyName" ascending:YES];
//    [request setSortDescriptors:[NSArray arrayWithObject:nameSort]];
//    
//    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
//    
//    [self.fetchedResultsController setDelegate:self];
//    
//    NSError *error = nil;
//    NSAssert([self.fetchedResultsController performFetch:&error], @"Error fetching developers: %@\n%@", [error localizedDescription], [error userInfo]);
//    
//    [self setFetchedResultsController: self.fetchedResultsController];
//    self.devShop = (DevShop*)[self.fetchedResultsController fetchedObjects];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    //return [[self.fetchedResultsController sections] count];
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

//    NSArray *sections = [self.fetchedResultsController sections];
//    id<NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
    
    if (section == 0) {
        return [self.devShop.entity attributesByName].count;
    } else if (section == 1) {
        return self.devShop.developers.count;
    } else {
        return 0;
    }
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.devShop.companyName;
            break;
        case 1:
            return @"Developers";
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"employeeCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.devShop.entity attributesByName].allKeys[indexPath.row];
    } else if (indexPath.section == 1) {
        Developer *dev = self.devShop.developers.allObjects[indexPath.row];
        cell.textLabel.text = dev.name;
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
//    [self.tableView beginUpdates];
//}
//
//- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
//    self.tableView.reloadData;
//    [self.tableView endUpdates];
//}

@end
