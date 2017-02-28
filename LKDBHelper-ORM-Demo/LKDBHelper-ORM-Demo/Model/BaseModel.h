//
//  BaseModel.h
//  LKDBHelper-ORM-Demo
//
//  Created by T on 17/2/28.
//  Copyright © 2017年 benbun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKDBHelper.h"

@interface BaseModel : NSObject

@end


@interface NSObject(PrintSQL)
+ (NSString *)getCreateTableSQL;
@end
