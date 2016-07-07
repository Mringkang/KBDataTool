//
//  KBDataTool.h
//  KBDataTool
//
//  Created by kangbing on 16/5/4.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBDataTool : NSObject

// 一般情况下最好存模型, 方便取值赋值

// 增加
+ (void)addKey:(NSString *)key andValue:(NSString *)value;
// 删除
+ (void)deleteWithKey:(NSString *)key;
// 判断
+ (BOOL)isKey:(NSString *)key;

// 查询
+ (NSArray *)queryWithKey:(NSString *)name andWithAge:(NSString *)age;
// 更新
+ (void)updateName:(NSString *)name AndWithAge:(NSString*)age;
@end
