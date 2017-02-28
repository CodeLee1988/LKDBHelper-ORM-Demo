//
//  Dog.m
//  LKDBHelper-ORM-Demo
//
//  Created by T on 17/2/28.
//  Copyright © 2017年 benbun. All rights reserved.
//

#import "Dog.h"

@implementation Dog
+(LKDBHelper *)getUsingLKDBHelper {
    return [BaseModel getUsingLKDBHelper];
}

// 表名
+(NSString *)getTableName {
    return @"dog_db";
}

// 主键
+(NSString *)getPrimaryKey {
    return @"id";
}

// 保存后是否更新主键id到model中
+(BOOL)autoIncreatPrimaryKey {
    return YES;
}
@end
