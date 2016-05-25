//
//  KBDataTool.h
//  KBDataTool
//
//  Created by kangbing on 16/5/4.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBDataTool : NSObject


+ (void)addKey:(NSString *)key andValue:(NSString *)value;

+ (void)deleteWithKey:(NSString *)key;

+ (BOOL)isKey:(NSString *)key;


+ (NSArray *)queryWithKey:(NSString *)name andWithAge:(NSString *)age;


@end
