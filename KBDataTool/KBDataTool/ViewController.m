//
//  ViewController.m
//  KBDataTool
//
//  Created by kangbing on 16/5/4.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "ViewController.h"
#import "KBDataTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor darkGrayColor];
    btn.frame = CGRectMake(20, 100, 100,44);
    [btn setTitle:@"删除" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn1 = [[UIButton alloc]init];
    btn1.backgroundColor = [UIColor darkGrayColor];
    btn1.frame = CGRectMake(20, 160, 100,44);
    [btn1 setTitle:@"插入" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(inset) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc]init];
    btn2.backgroundColor = [UIColor darkGrayColor];
    btn2.frame = CGRectMake(20, 220, 100,44);
    [btn2 setTitle:@"查询" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(query) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

- (void)delete{
    
    
    NSLog(@"删除");
    
    [KBDataTool deleteWithKey:@"jack"];
}

- (void)inset{
    
    NSLog(@"插入");
    [KBDataTool addKey:@"jack" andValue:[NSString stringWithFormat:@"%d",arc4random_uniform(100)]];
    
    [KBDataTool addKey:@"rose" andValue:@"21"];
    
    
    
    
    
    
}


- (void)query{
    
    
    NSArray *name = [KBDataTool queryWithKey:@"name" andWithAge:@"age"];
    
    NSLog(@"%@",name);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
