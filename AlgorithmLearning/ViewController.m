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
    [self selectionDescendingSort:array];
}

/**
 冒泡降序排序
 
 重复的比较数组中相邻的两个元素。如果一个元素比另一个元素大（小），那么就交换这两个元素的位置。重复这一比较直至最后一个元素
 
 @param array 待排序数据
 */
- (NSMutableArray *)bubbleDescendingSort:(NSMutableArray *)array{
    NSNumber *temp;
    //如果循环一次后如果没有数据交换，这就说明此序列已经有序，不需要再继续后面的循环判断工作
    BOOL flag =YES;
    for(int i=0; i < array.count -1 && flag; i++){
        flag = NO;
        for (int j = 0; j < array.count-1-i; j++) {
            if ([array[j] intValue] < [array[j+1] intValue]) {
                temp = array[j] ;
                array[j] = array[j+1];
                array[j+1] = temp;
                flag = YES;
            }
        }
    }
    NSLog(@"冒泡降序结果：%@",array);
    return array;
}

/**
 选择排序

 从数组的第i个元素开始到第n个元素，寻找最小的元素。（具体过程为:先设arr[i]为最小，逐一比较，若遇到比之小的则交换）
 
 @param array 待排序数据
 @return 排序后的数组
 */
- (NSMutableArray *)selectionDescendingSort:(NSMutableArray *)array{
    NSNumber *temp;
    for (int i = 0; i < array.count-1; i++) {
        for (int j =i+1; j < array.count; j++) {
            if ([array[i] intValue] < [array[j] intValue]) {
                temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    NSLog(@"选择排序降序结果：%@",array);
    return array;
}


@end
