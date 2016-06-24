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

@interface CompaniesTableViewController () <NSFetchedResultsControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate>

@property NSFetchedResultsController *fetchedResultsController;
@property UISearchController *searchController;

@property DevShop *devShopToPass;

@property SortBy sortBy;
@property BOOL  ascending;

@property NSMutableArray *devShopsSearched;
@property NSArray * devShopsToSearch;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sortOrderButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation CompaniesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sortBy = ShopName;
    self.managedObjectContext = [[DevBizDataModel sharedDataModel] mainContext];
    [self getShopsAscending:true byNameOrEmployeeCount: ShopName withPredicate: nil];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController: nil];
    [self.navigationController.navigationBar setHidden: false];
    self.searchController.hidesNavigationBarDuringPresentation = false;
    self.searchController.dimsBackgroundDuringPresentation = false;
    self.searchController.definesPresentationContext = true;
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
}

- (IBAction)sortByControlChanged:(UISegmentedControl *)sender {
    // tag0 == CompanyName, tag1 == Employee Count
    BOOL ascending = [self.sortOrderButton.title  isEqual: @"Ascending"] ? false : true;
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.sortBy = ShopName;
        [self getShopsAscending: ascending byNameOrEmployeeCount:self.sortBy withPredicate: nil];
    } else if (selectedSegment == 1) {
        self.sortBy = ShopEmployeeCount;
        [self getShopsAscending: ascending byNameOrEmployeeCount:self.sortBy withPredicate: nil];
    }
}

- (IBAction)sortOrderButtonPressed:(UIBarButtonItem *)sender {
    if ([self.sortOrderButton.title  isEqualToString: @"Ascending"]) {
        [self.sortOrderButton setTitle: @"Descending"];
        self.ascending = true;
        [self getShopsAscending:true byNameOrEmployeeCount:self.sortBy withPredicate: nil];
    } else if ([self.sortOrderButton.title isEqualToString:@"Descending"]) {
        [self.sortOrderButton setTitle: @"Ascending"];
        self.ascending = false;
        [self getShopsAscending:false byNameOrEmployeeCount:self.sortBy withPredicate: nil];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.devShopsSearched.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"shopCell" forIndexPath:indexPath];
    
    DevShop *shop = (DevShop*)[self.devShopsSearched objectAtIndex:indexPath.row];
    
    cell.textLabel.text = shop.companyName;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Employees: %@", shop.numberOfEmployees];
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

#pragma mark - Search
// TODO: DO SEARCH!!
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
  
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.devShopsSearched removeAllObjects];
    self.devShopsSearched = [self.devShopsToSearch mutableCopy];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.devShopsSearched removeAllObjects];
    
    if (![searchBar.text  isEqual: @""]) {
        NSPredicate *searchPredicate;
        NSPredicate *searchCompanyNamePredicate = [NSPredicate predicateWithFormat: @"companyName contains[cd] %@", searchText];
        NSPredicate *employeesPredicate = [NSPredicate predicateWithFormat: @"numberOfEmployees == %ld", searchText.integerValue];
        
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        
        if ([searchText rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            searchPredicate = employeesPredicate;
        } else {
            searchPredicate = searchCompanyNamePredicate;
        }
        
        self.devShopsSearched = [[self.devShopsToSearch filteredArrayUsingPredicate: searchPredicate]mutableCopy];
    } else {
        self.devShopsSearched = [self.devShopsToSearch mutableCopy];
    }
    
    [self.tableView reloadData];
}

- (void)getShopsAscending:(BOOL)ascending byNameOrEmployeeCount:(SortBy)sortType withPredicate:(NSPredicate*)predicate {
    NSString *sortBy;
    if (sortType == ShopName) {
        sortBy = @"companyName";
    } else if (sortType == ShopEmployeeCount) {
        sortBy = @"numberOfEmployees";
    }
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DevShop"];
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey: sortBy ascending: ascending];
    [request setSortDescriptors:[NSArray arrayWithObject:nameSort]];
    request.predicate = predicate;
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName: nil];
    
    [self.fetchedResultsController setDelegate:self];
    
    NSError *error = nil;
    NSAssert([self.fetchedResultsController performFetch:&error], @"Error fetching developers: %@\n%@", [error localizedDescription], [error userInfo]);
    
    [self setFetchedResultsController: self.fetchedResultsController];
    [self.devShopsSearched removeAllObjects];
    self.devShopsToSearch = [self.fetchedResultsController fetchedObjects];
    self.devShopsSearched = [self.devShopsToSearch mutableCopy];
    [self.tableView reloadData];
}

@end
