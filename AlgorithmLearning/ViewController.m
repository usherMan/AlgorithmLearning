//
//  ViewController.m
//  AlgorithmLearning
//
//  Created by usher on 2019/8/14.
//  Copyright © 2019年 usher. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"23",@"265",@"89",@"11"]];
    [self bubbleDescendingSort:array];
}

/**
 冒泡降序排序

 @param array 待排序数据
 */
- (NSMutableArray *)bubbleDescendingSort:(NSMutableArray *)array{
    
    NSNumber *temp;
    for(int i=0; i < array.count -1; i++){
        for (int j = i+1; j < array.count-1-i; j++) {
            if ([array[j] intValue] < [array[j+1] intValue]) {
                temp = array[j] ;
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
    NSLog(@"冒泡降序结果：%@",array);
    return array;
}


@end
