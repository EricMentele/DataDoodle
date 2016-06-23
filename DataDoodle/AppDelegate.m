//
//  AppDelegate.m
//  DataDoodle
//
//  Created by Eric Mentele on 6/20/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//http://nsscreencast.com/episodes/11-core-data-basics

#import "AppDelegate.h"
#import "DevShop.h"
#import "Developer.h"
#import "DevBizDataModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self populateDevShops];
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)populateDevShops {
    NSManagedObjectContext *context = [[DevBizDataModel sharedDataModel] mainContext];
    if (context) {
        NSLog(@"Context is ready!");
        NSArray *companyNames = @[@"Bit Swizzlers", @"Crazy Coders", @"Fast Fingers", @"Dev-ils", @"Foo Solutions", @"Bar Consulting", @"Bit Floor", @"Clown Code", @"Bit Brains Software", @"Keyboard Smashers", @"Mac Hackers", @"Code Clan", @"Codetastic"];
        NSArray *developerNames = @[@"Joe", @"Jack", @"James", @"Jill", @"Jamilia", @"Sungsil", @"Sara", @"Jasmine", @"Brett", @"Boon", @"Mandela", @"Sir Codealot"];
        
        // loop through company names and create a company for each.
        for (NSString *name in companyNames) {
            DevShop *codeShop = [NSEntityDescription insertNewObjectForEntityForName:@"DevShop" inManagedObjectContext:context];
            codeShop.companyName = name;
            
            NSUInteger numberOfDevelopers = arc4random_uniform((int)[developerNames count]);
            
            for (int i = 0; i < numberOfDevelopers; i+=1) {
                Developer *dev = [NSEntityDescription insertNewObjectForEntityForName:@"Developer" inManagedObjectContext:context];
                dev.name = developerNames[i];
                [codeShop addDevelopersObject: dev];
            }
        }
        
        [context save:nil];
    } else {
        NSLog(@"Context was nil :(");
    }

}

@end
