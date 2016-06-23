//
//  CompaniesTableViewController.m
//  DataDoodle
//
//  Created by Eric Mentele on 6/22/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import "CompaniesTableViewController.h"
#import "CompanyRosterTableViewController.h"

typedef enum {
    ShopName,
    ShopEmployeeCount
}SortBy;

@interface CompaniesTableViewController () <NSFetchedResultsControllerDelegate>

@property NSFetchedResultsController *fetchedResultsController;
@property DevShop *devShopToPass;
@property SortBy sortBy;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sortOrderButton;

@end

@implementation CompaniesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sortBy = ShopName;
    self.managedObjectContext = [[DevBizDataModel sharedDataModel] mainContext];
    [self getShopsAscending:true byNameOrEmployeeCount: ShopName];
}

- (IBAction)sortByControlChanged:(UISegmentedControl *)sender {
    // tag0 == CompanyName, tag1 == Employee Count
    BOOL ascending = [self.sortOrderButton.title  isEqual: @"Ascending"] ? false : true;
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.sortBy = ShopName;
        [self getShopsAscending: ascending byNameOrEmployeeCount:self.sortBy];
    } else if (selectedSegment == 1) {
        self.sortBy = ShopEmployeeCount;
        [self getShopsAscending: ascending byNameOrEmployeeCount:self.sortBy];
    }
}

// TODO: Fix backwards sort for employee number.
- (IBAction)sortOrderButtonPressed:(UIBarButtonItem *)sender {
    if ([self.sortOrderButton.title  isEqualToString: @"Ascending"]) {
        [self.sortOrderButton setTitle: @"Descending"];
        [self getShopsAscending:true byNameOrEmployeeCount:self.sortBy];
    } else if ([self.sortOrderButton.title isEqualToString:@"Descending"]) {
        [self.sortOrderButton setTitle: @"Ascending"];
        [self getShopsAscending:false byNameOrEmployeeCount:self.sortBy];
    }
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

- (void)getShopsAscending:(BOOL)ascending byNameOrEmployeeCount:(SortBy)sortType {
    NSString *sortBy;
    if (sortType == ShopName) {
        sortBy = @"companyName";
    } else if (sortType == ShopEmployeeCount) {
        sortBy = @"numberOfEmployees";
    }
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DevShop"];
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey: sortBy ascending: ascending];
    [request setSortDescriptors:[NSArray arrayWithObject:nameSort]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName: nil];
    
    [self.fetchedResultsController setDelegate:self];
    
    NSError *error = nil;
    NSAssert([self.fetchedResultsController performFetch:&error], @"Error fetching developers: %@\n%@", [error localizedDescription], [error userInfo]);
    
    [self setFetchedResultsController: self.fetchedResultsController];
    [self.tableView reloadData];
}

@end
