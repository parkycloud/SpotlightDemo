//
//  AppDelegate.m
//  SpotlightDemo
//
//  Created by xmc on 16/2/12.
//  Copyright © 2016年 parkycloud. All rights reserved.
//

#import "AppDelegate.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0

#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

#endif

#import "FirstViewController.h"
#import "SecondViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self setupSearchInfo];
    
    return YES;
}


- (void)setupSearchInfo
{
    CSSearchableItemAttributeSet *lolItemAttributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeImage];
    
    lolItemAttributeSet.title = @"英雄联盟";
    lolItemAttributeSet.keywords = @[@"剑圣",@"蛮王",@"武器",@"剑姬",@"剑魔"];
    lolItemAttributeSet.contentDescription = @"这是一个5V5竞技游戏";
    lolItemAttributeSet.thumbnailData = [NSData dataWithContentsOfFile:@"info.png"];
    
    // spotlightInfo 可以作为一些数据传递给接受的地方
    // domainId      id,通过这个id来判断是哪个spotlight
    CSSearchableItem *lolItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"lol" domainIdentifier:@"com.parkycloud.app.lol" attributeSet:lolItemAttributeSet];
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[lolItem] completionHandler:^(NSError * error) {
        if (error) {
            NSLog(@"indexSearchableItems Error:%@",error.localizedDescription);
            
        }
    }];



    CSSearchableItemAttributeSet *mhxyItemAttributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeImage];
    
    mhxyItemAttributeSet.title = @"梦幻西游";
    mhxyItemAttributeSet.keywords = @[@"龙太子",@"神天兵",@"虎头怪",@"飞燕女",@"舞天姬"];
    mhxyItemAttributeSet.contentDescription = @"这是一个经典回合制游戏";
    mhxyItemAttributeSet.thumbnailData = [NSData dataWithContentsOfFile:@"info.png"];
    
    // spotlightInfo 可以作为一些数据传递给接受的地方
    // domainId      id,通过这个id来判断是哪个spotlight
    CSSearchableItem *mhxyItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"mhxy" domainIdentifier:@"com.parkycloud.app.lol" attributeSet:mhxyItemAttributeSet];
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[mhxyItem] completionHandler:^(NSError * error) {
        if (error) {
            NSLog(@"indexSearchableItems Error:%@",error.localizedDescription);
            
        }
    }];

    /*//删除索引
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:@[@"lol",@"mhxy"] completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];*/
}


- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{

    if ([[userActivity activityType] isEqualToString:CSSearchableItemActionType])
    {
        NSString *uniqueIdentifier = [userActivity.userInfo objectForKey: CSSearchableItemActivityIdentifier];
        
        if ([uniqueIdentifier isEqualToString:@"lol"])
        {
            AppDelegate *app = application.delegate;
            
            FirstViewController *firstVC = [[FirstViewController alloc] init];
            
            UINavigationController *firstNavi = [[UINavigationController alloc] initWithRootViewController:firstVC];
            
            [app.window.rootViewController presentViewController:firstNavi animated:YES completion:nil];
            
        }
        else if ([uniqueIdentifier isEqualToString:@"mhxy"])
        {
            AppDelegate *app = application.delegate;
            
            SecondViewController *secondVC = [[SecondViewController alloc] init];
            
            UINavigationController *secondNavi = [[UINavigationController alloc] initWithRootViewController:secondVC];
            
            [app.window.rootViewController presentViewController:secondNavi animated:YES completion:nil];
        
        }
        
    }
    
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
