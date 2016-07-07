//
//  KBDataTool.m
//  KBDataTool
//
//  Created by kangbing on 16/5/4.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "KBDataTool.h"
#import "FMDB.h"

@implementation KBDataTool

static FMDatabase *_db;

+ (void)initialize
{
    //1. 获取路径
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"demwo.db"];
    
    NSLog(@"filePath : %@", filePath);
    
    //2. 创建数据库
    _db = [FMDatabase databaseWithPath:filePath];
    
    //3. 判断是否打开成功
    if (![_db open]) {
        return;
    }
    
    //4. 创建表
    //id: 主键 从1开始自增, 不需要设置
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_table(id integer PRIMARY KEY, name text NOT NULL, age text NOT NULL);"];
}


+ (void)addKey:(NSString *)key andValue:(NSString *)value{

    
    [_db executeUpdate:@"INSERT INTO t_table (name, age) VALUES (?, ?);", key, value];

}

+ (void)deleteWithKey:(NSString *)key{

    [_db executeUpdateWithFormat:@"DELETE FROM t_table WHERE name=%@", key];  // format就用%@
    
}


+ (BOOL)isKey:(NSString *)key{

    //1. 返回结果集
    FMResultSet *set = [_db executeQueryWithFormat:@"SELECT count(*) AS count FROM t_table WHERE name=%@", key];
    
    //2. 调用next --> 要想查询结果, 必须调用next方法 --> 才会去数据库查找值
    [set next];
    
    
    //3. 获取个数
    //intForColumn: 获取指定列名的 值 (当需要取int类型的时候,调用此方法)
    return [set intForColumn:@"count"] == 1;



}

+ (NSArray *)queryWithKey:(NSString *)name andWithAge:(NSString *)age{

    
    NSMutableArray *mua = [NSMutableArray arrayWithCapacity:8];
    
    
    FMResultSet *rs = [_db executeQuery:@"SELECT  *FROM t_table"];
    

    while ([rs next]) {
        
        NSString *aname = [rs stringForColumn:name];  //字段
        
        NSString *aage = [rs stringForColumn:age];
        
        
        
        [mua addObject:aname];
        [mua addObject:aage];
        
        return mua.copy;
        
    }
    
    
    return nil;


}

+ (void)updateName:(NSString *)name AndWithAge:(NSString*)age{
    
    // 更新数据
    [_db executeUpdateWithFormat:@"UPDATE t_list_model SET name =%@ WHERE age =%@", name, age];
}


/*
 int ID = [resultSet intForColumn:@"id"];
 NSString *name = [resultSet stringForColumn:@"name"];
 int age = [resultSet intForColumn:@"age"];
 
 */

@end
