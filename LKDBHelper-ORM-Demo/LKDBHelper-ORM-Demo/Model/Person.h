//
//  Person.h
//  LKDBHelper-ORM-Demo
//
//  Created by T on 17/2/28.
//  Copyright © 2017年 benbun. All rights reserved.
//

#import "BaseModel.h"

@interface Person : BaseModel
/**id*/
@property(nonatomic,assign) NSInteger id;
/** Person name*/
@property (nonatomic, copy) NSString *name;
/** Person age*/
@property (nonatomic, assign) NSInteger age;
@property(nonatomic,strong) NSArray *dogs;
@end
