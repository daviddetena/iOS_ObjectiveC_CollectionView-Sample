//
//  AppDelegate.m
//  CollectionSample
//
//  Created by David de Tena on 27/04/16.
//  Copyright © 2016 David de Tena. All rights reserved.
//

#import "AppDelegate.h"
#import "DTCColors.h"
#import "DTCColorfulViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create model
    DTCColors *model = [[DTCColors alloc] init];
    
    // Create and customize CollectionView's layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 50);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 20;
    
    // Add margin between sections
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    // Header
    // With UICollectionViewScrollDirection vertical first param is ignored (as we want the full width). With horizontal, 2nd param is ignored
    layout.headerReferenceSize = CGSizeMake(60, 60);
    
    
    // Create controller
    DTCColorfulViewController *cVC = [[DTCColorfulViewController alloc] initWithModel:model layout:layout];
    
    // Wrap in Navigation
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:cVC];
    
    
    self.window.rootViewController = navVC;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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

@end
