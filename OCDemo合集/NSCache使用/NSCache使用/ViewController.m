//
//  ViewController.m
//  NSCache使用
//
//  Created by ng on 2020/6/16.
//  Copyright © 2020 ngarihealth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSCacheDelegate>
@property (strong, nonatomic) NSCache * cache;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.cache =[[NSCache alloc]init];
    self.cache.countLimit = 3;//数量限制
    self.cache.totalCostLimit = 300;//容量限制
    self.cache.delegate = self;
    [self.cache setName:@"cache234234"];
    [self.cache setObject:@"0" forKey:@"123--0" cost:12];//cost 是该对象占用的空间大小
    [self.cache setObject:@"1" forKey:@"123--1"];
    [self.cache setObject:@"2" forKey:@"123--2"];
    [self.cache setObject:@"3" forKey:@"123--3"];
    [self.cache setObject:@"4" forKey:@"123--4"];
}
//缓存中的一个对象即将被删除时被回调
//什么情况下会被删除
/*
 1.当添加的对象数量大于countLimit cost值大于totalCostLimit
 2.当NSCache缓存对象自身被释放
 3.调用removeObjectForKey:方法
 4.调用removeAllObjects
 5.程序进入后台后
 6.收到系统的内存警告
 */
-(void)cache:(NSCache *)cache willEvictObject:(id)obj{
    NSLog(@"will remove === %@,%@",obj,cache.name);
}

@end
