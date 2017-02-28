//
//  Dog.h
//  LKDBHelper-ORM-Demo
//
//  Created by T on 17/2/28.
//  Copyright © 2017年 benbun. All rights reserved.
//

#import "BaseModel.h"

@interface Dog : BaseModel
/**id*/
@property(nonatomic,assign) NSInteger id;
/**personId*/
@property(nonatomic,assign) NSInteger personId;
/** Dog name*/
@property (nonatomic, copy) NSString *name;
/** Dog age*/
@property (nonatomic, assign) NSInteger age;
@end
