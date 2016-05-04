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
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"demo.db"];
    
    NSLog(@"filePath : %@", filePath);
    
    //2. 创建数据库
    _db = [FMDatabase databaseWithPath:filePath];
    
    //3. 判断是否打开成功
    if (![_db open]) {
        return;
    }
    
    //4. 创建表
    //id: 主键 从1开始自增, 不需要设置
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_table(id integer PRIMARY KEY, key text NOT NULL, value text NOT NULL);"];
}


+ (void)addKey:(NSString *)key andValue:(NSString *)value{

    [_db executeUpdateWithFormat:@"INSERT INTO t_table(key,value) VALUES(%@,%@);",key,value];

}

+ (void)deleteWithKey:(NSString *)key{

    [_db executeUpdateWithFormat:@"DELETE FROM t_table WHERE key=%@", key];
    
}

+ (BOOL)isKey:(NSString *)key{

    //1. 返回结果集
    FMResultSet *set = [_db executeQueryWithFormat:@"SELECT count(*) AS count FROM t_table WHERE key=%@", key];
    
    //2. 调用next --> 要想查询结果, 必须调用next方法 --> 才会去数据库查找值
    [set next];
    
    
    //3. 获取个数
    //intForColumn: 获取指定列名的 值 (当需要取int类型的时候,调用此方法)
    return [set intForColumn:@"count"] == 1;



}

+ (NSString *)queryWithKey:(NSString *)key{

    FMResultSet *rs = [_db executeQuery:@"SELECT  *FROM t_table"];
    

    while ([rs next]) {
        
        NSString *name = [rs stringForColumn:@"key"];
        
        
        return name;
        
    }
    
    return nil;


}

@end
