//
//  RKRSearchStreetsViewController.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRSearchViewController.h"
#import "RKRStreetCell.h"
#import "RKRSearchResultController.h"

static NSString *StreetSearchCell = @"StreetSearchCell";


@interface RKRSearchViewController() <UITableViewDelegate, UITableViewDataSource, RKRSearchDataManagerDelegate, UISearchResultsUpdating, UISearchControllerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@end


@implementation RKRSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create the search results controller and store a reference to it.
//    RKRSearchResultController *resultsController = [[RKRSearchResultController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    // Use the current view controller to update the search results.
    self.searchController.searchResultsUpdater = self;
    
    // Install the search bar as the table header.
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    // It is usually good to set the presentation context.
    self.definesPresentationContext = YES;
    self.searchController.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.dataManager.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.dataManager.delegate = nil;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataManager.allStreets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0) {
        RKRStreetCell *cell = [tableView dequeueReusableCellWithIdentifier:StreetSearchCell forIndexPath:indexPath];
        RKRStreet *street = self.dataManager.allStreets[indexPath.row];
        [cell setStreet:street];
        return cell;
    }
    return [UITableViewCell new];
}

#pragma mark - RKRSearchDataManagerDelegate
- (void)dataManagerDidUpdate:(RKRSearchDataManager *)dataManager {
    [self.tableView reloadData];
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.dataManager setFilter:searchController.searchBar.text];
    [self.tableView reloadData];
}

@end
