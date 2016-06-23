//
//  CompaniesTableViewController.m
//  DataDoodle
//
//  Created by Eric Mentele on 6/22/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import "CompaniesTableViewController.h"
#import "CompanyRosterTableViewController.h"

@interface CompaniesTableViewController () <NSFetchedResultsControllerDelegate>

@property NSFetchedResultsController *fetchedResultsController;
@property DevShop *devShopToPass;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sortOrderButton;

@end

@implementation CompaniesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.managedObjectContext = [[DevBizDataModel sharedDataModel] mainContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DevShop"];
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"companyName" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:nameSort]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
    
    [self.fetchedResultsController setDelegate:self];
    
    NSError *error = nil;
    NSAssert([self.fetchedResultsController performFetch:&error], @"Error fetching developers: %@\n%@", [error localizedDescription], [error userInfo]);
    
    [self setFetchedResultsController: self.fetchedResultsController];
}

- (IBAction)sortByControlChanged:(UISegmentedControl *)sender {
    // tag1 == CompanyName, tag2 == Employee Count
    
}

- (IBAction)sortOrderButtonPressed:(UIBarButtonItem *)sender {
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.fetchedResultsController.sections[section] numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"shopCell" forIndexPath:indexPath];
    
    DevShop *shop = (DevShop*)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = shop.companyName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DevShop *shop = (DevShop*)[self.fetchedResultsController objectAtIndexPath:indexPath];
    self.devShopToPass = shop;
    [self performSegueWithIdentifier:@"shopSelected" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"shopSelected"]) {
        CompanyRosterTableViewController *destinationVC = [segue destinationViewController];
        destinationVC.devShop = self.devShopToPass;
    }
}

@end
