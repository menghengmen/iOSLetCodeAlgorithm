//
//  ViewController.m
//  LetCodeAlgorithm
//
//  Created by 哈哈 on 2019/10/12.
//  Copyright © 2019 MengHeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //   算法题描述： 给定一个整数数组 nums 和一个目标值         target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
    //
    //    你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
    //
    //    示例:
    //
    //    给定 nums = [2, 7, 11, 15], target = 9
    //
    //    因为 nums[0] + nums[1] = 2 + 7 = 9
    //    所以返回 [0, 1]

        [self calcalateWithNumbers:@[@1,@2,@3,@5,@6] target:7];
    
}
-(void)calcalateWithNumbers:(NSArray*)arr target:(int)target{
    for (int i = 0; i <arr.count-1; i ++) {
        for (int j = i +1; j <arr.count; j ++) {
            if ([arr[i] intValue] + [arr[j] intValue] == target) {
                NSLog(@"%d--***--%d",i,j);
            }
        }
    }
}


@end
