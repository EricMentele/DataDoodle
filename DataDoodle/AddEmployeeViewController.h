//
//  AddEmployeeViewController.h
//  DataDoodle
//
//  Created by Eric Mentele on 6/21/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmployeeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *employeeName;
@property (weak, nonatomic) IBOutlet UITextField *employeeTitle;
@property (weak, nonatomic) IBOutlet UITextField *employeeSalary;
@property (weak, nonatomic) IBOutlet UITextField *employeeStartDate;

@end
