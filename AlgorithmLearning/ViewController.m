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
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    UIImageView *view =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_WIDTH *1.44)];
    view.image =[UIImage imageNamed:@"user.jpg"];
    [self.view addSubview:view];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"23",@"265",@"89",@"11",@"67"]];
//    [self bubbleDescendingSort:array];
//    [self selectionDescendingSort:array];
//    [self quickDescendingSort:array withLeftIndex:0 withRightIndex:array.count-1];
//    [self directInsertionSortingArray:array];
    [self binaryInsertionDescendingSortingArray:array];
}
#pragma mark 排序算法
/**
 1、冒泡降序排序
 思想：重复的比较数组中相邻的两个元素。如果一个元素比另一个元素大（小），那么就交换这两个元素的位置。重复这一比较直至最后一个元素
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
 2、选择排序
 基本思想：从数组的第i个元素开始到第n个元素，寻找最小的元素。（具体过程为:先设arr[i]为最小，逐一比较，若遇到比之小的则交换）
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

/**
 3、快速排序
 基本思想：
 通过一趟排序将待排序的记录分割成独立的两部分，其中一部分记录的关键字均比另一部分记录的关键字小，则可分别对这两部分记录继续进行排序
 排序思路：
 数组选第一个数，把比数小的放到数的左边，比数大的放到右边，结束后对左右两边的数组作重复处理即可。
 */
- (NSMutableArray *)quickDescendingSort:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex withRightIndex:(NSInteger)rightIndex{
    //如果数据长度为0或1时返回
    if (leftIndex >= rightIndex) {
        return array;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    while (i < j) {
        /**** 首先从右边j开始查找比基准数大的值 ***/
        while (i < j && [array[j] integerValue] <= key) {
            j--;
        }
        //如果比基准数大，则将查找到的大值调换到i的位置
        array[i] = array[j];
        
        /**** 当在右边查找到一个比基准数大的值时，就从i开始往后找比基准数小的值 ***/
        while (i < j && [array[i] integerValue] >= key) {//如果比基准数大，继续查找
            i++;
        }
        //如果比基准数小，则将查找到的大值调换到j的位置
        array[j] = array[i];
    }
    
    //将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickDescendingSort:array withLeftIndex:leftIndex withRightIndex:i - 1];
    //排序基准数右边的
    [self quickDescendingSort:array withLeftIndex:i + 1 withRightIndex:rightIndex];
    NSLog(@"快速排序降序结果：%@",array);
    return array;
}

/**
 4、直接插入 排序
 基本思想：将待排序元素插入到已排序区间的位置，直到未排序区间为空
 过程：
 1、从第一个元素开始，该元素可以认为已经被排序
 2、取出下一个元素，在已经排序的元素序列中从后向前扫描
 3、如果该元素（已排序）大于新元素，将该元素移到下一位置
 4、重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
 5、将新元素插入到该位置后
 6、重复步骤2~5
 */
- (NSMutableArray *)directInsertionSortingArray:(NSMutableArray *)array{
    for (int i =1; i<array.count; i++) {
        // j是一个坑，确定坑的位置，再z把数从坑里取出来，注意顺序
        int j =i;
        //从坑里取数
        NSInteger temp = [array[i] integerValue];
        if ([array[i] integerValue] > [array[i-1] integerValue]) {
            while (j >0 && temp > [array[j-1] integerValue]) {
                array[j]=array[j-1];
                j--;
            }
            array[j] =@(temp);
        }
    }
    NSLog(@"直接插入排序降序结果：%@",array);
    return array;
}

/**
 4.1二分法（折半插入）排序
 
 基本思想：在插入第i个元素时，对前面的0～i-1元素进行折半，先跟他们中间的那个元素比，如果小，则对前半再进行折半，否则对后半
 进行折半，直到left>right，然后再把第i个元素前1位与目标位置之间的所有元素后移，再把第i个元素放在目标位置上。
 */
- (NSMutableArray *)binaryInsertionDescendingSortingArray:(NSMutableArray *)array{
    if (array.count<=1) {
        return array;
    }
    NSInteger temp =0;
    int low,high,mid = 0;
    for (int i =1; i<array.count; i++) {
        //保存待排序的数据
        temp = [array[i] integerValue];
        low = 0;
        high = i-1;
        while(low <= high){
            //有序数组的中间坐标，此时用于二分查找，减少查找次数
            mid = (low +high)/2;
            if ([array[mid] integerValue] >temp) {
                low = mid+1;
            }else{
                high = mid-1;
            }
        }
        //从low开始向后移动数据
        for (int j = i-1; j >= low; j--) {
            array[j+1]=array[j];
        }
        //待排序元素插入到目标位置中
        array[low] = @(temp);
    }
     NSLog(@"二分法排序降序结果：%@",array);
    return array;
}

/**
 4.2 希尔排序（插入排序高效改进版）
 

 */
- (NSMutableArray *)shellInsertionDescendingSortingArray:(NSMutableArray *)array{
    
    return nil;
}

@end
