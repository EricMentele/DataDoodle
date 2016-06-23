//
//  CompaniesTableViewController.h
//  DataDoodle
//
//  Created by Eric Mentele on 6/22/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DevBizDataModel.h"

@interface CompaniesTableViewController : UITableViewController

@property (weak) NSManagedObjectContext *managedObjectContext;

@end
