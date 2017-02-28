//
//  Person.m
//  LKDBHelper-ORM-Demo
//
//  Created by T on 17/2/28.
//  Copyright © 2017年 benbun. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

+(LKDBHelper *)getUsingLKDBHelper {
    return [BaseModel getUsingLKDBHelper];
}

+(NSString *)getTableName {
    return @"person_db";
}

+(NSString *)getPrimaryKey {
    return @"id";
}

+(BOOL)autoIncreatPrimaryKey {
    return YES;
}

-(id)userGetValueForModel:(LKDBProperty *)property {
    return nil;
}
-(void)userSetValueForModel:(LKDBProperty *)property value:(id)value {
}

+ (BOOL)dbWillDelete:(Person *)entity{
    
    for (Dog *dog in entity.dogs) {
        [dog deleteToDB];
    }

    return YES;
}

+(void)dbDidInserted:(Person *)entity result:(BOOL)result {
    NSInteger personId = entity.rowid;
    NSArray *dogs = nil;
    
    NSMutableArray *arrM = [NSMutableArray array];
    if (entity.dogs.count!=0) {
        dogs = entity.dogs;
        [arrM addObject:dogs];
    }
    
    for (NSArray *arr in arrM) {
        for (NSObject *obj in arr) {
            [obj setValue:@(personId) forKey:@"personId"];
        }
    }
    
    [entity updateToDB];
}

@end
