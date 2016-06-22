//
//  CompanyRosterTableViewController.h
//  DataDoodle
//
//  Created by Eric Mentele on 6/21/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DevBizDataModel.h"
#import "Developer.h"

@interface CompanyRosterTableViewController : UITableViewController

@property (weak) NSManagedObjectContext *managedObjectContext;

@end
