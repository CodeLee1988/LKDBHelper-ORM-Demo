//
//  AppDelegate.m
//  LKDBHelper-ORM-Demo
//
//  Created by T on 17/2/28.
//  Copyright © 2017年 benbun. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
#import "Dog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"😊😊😊%@", NSHomeDirectory());
    
    /**
    CFAbsoluteTime  startTime =CFAbsoluteTimeGetCurrent();
    LKDBHelper *helper = [Person getUsingLKDBHelper];
    [helper executeForTransaction:^BOOL(LKDBHelper *helper) {
        for (NSInteger i = 0; i<10000; i++) {
            [self addDatas];
        }
        return YES;
    }];
    CFAbsoluteTime  linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"Linked in %f ms", linkTime *1000.0);
    //*/
    
    // 增   create
    [self addDatas];
    
    // 查 read
//    [self readDatas];
    
    // 改 update
//    [self updateDatas];
    
    // 删  delete
//    [self deleteDatas];
    
    return YES;
}
  // 增   create
- (void)addDatas{
    Person *person1 = [Person new];
    person1.name = @"person1";
    person1.age = 1;
    
    Dog *dog1 = [Dog new];
    dog1.name = @"dog1";
    dog1.age = 1;
    dog1.personId = person1.rowid;
    
    Dog *dog2 = [Dog new];
    dog2.name = @"dog2";
    dog2.age = 2;
    dog2.personId = person1.rowid;
    
    person1.dogs = @[dog1, dog2];
    [person1 updateToDB];
    
}

  // 查 read
- (void)readDatas{
    
   Person *person = [Person searchSingleWithWhere:@"id = 1" orderBy:nil];
    NSLog(@"*******😊person.name😊***********%@", person.name);
    
    NSArray *dogs = [Dog searchWithWhere:[NSString stringWithFormat:@"personId = %tu", person.rowid] orderBy:nil offset:0 count:0];
    
    NSLog(@"*******😊dogs.count😊***********%tu", dogs.count);
    
    Dog *dog = [Dog searchSingleWithWhere:[NSString stringWithFormat:@"personId = %tu and age = 2", person.rowid] orderBy:nil];
    NSLog(@"******😊dog.name😊************%@", dog.name);
}

 // 改 update
- (void)updateDatas{
    // change person name
    Person *person = [Person searchSingleWithWhere:@"id = 1" orderBy:nil];
    person.name = @"person100";
    [person updateToDB];
    NSLog(@"*******😊person.name😊***********%@", person.name);
    
    // change dog2 name
     Dog *dog = [Dog searchSingleWithWhere:[NSString stringWithFormat:@"personId = %tu and age = 2", person.rowid] orderBy:nil];
    dog.name = @"dog200";
    [person updateToDB];
    NSLog(@"******😊dog.name😊************%@", dog.name);
}

 // 删  delete
- (void)deleteDatas{
    // delete dog2
    
    Dog *dog = [Dog searchSingleWithWhere:@"personId = 1 and age = 2"orderBy:nil];
    [dog deleteToDB];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
