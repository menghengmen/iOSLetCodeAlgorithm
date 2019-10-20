//
//  ViewController.m
//  LetCodeAlgorithm
//
//  Created by 哈哈 on 2019/10/12.
//  Copyright © 2019 MengHeng. All rights reserved.
//

#import "ViewController.h"
#include <stdio.h>

struct ListNode {
    int val;
    struct ListNode *next;
};


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //   算法题描述：1 给定一个整数数组 nums 和一个目标值         target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
    //    你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
    //    示例:
    //    给定 nums = [2, 7, 11, 15], target = 9
    //    因为 nums[0] + nums[1] = 2 + 7 = 9
    //    所以返回 [0, 1]

        [self calcalateWithNumbers:@[@1,@2,@3,@5,@6] target:7];
    
// 3 最长非重复子字符串算法 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
//
//  示例 1:
//  输入: "abcabcbb"
//  输出: 3
//  解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

    NSString *str = @"gasdkgkasgjdnafgdgda";
    NSMutableSet*set = [NSMutableSet new];
      long n = str.length;
      int ans = 0, i = 0, j = 0 ,index = 0;
      while (i<n && j<n) {
          if (![set containsObject:[str substringWithRange:NSMakeRange(j,1)]]) {
               [set addObject:[str substringWithRange:NSMakeRange(j++, 1)]];
                    if (j - i > ans) {
                         ans = j - i;
                         index = i;
                       }
                 }else{
              
             [set removeObject:[str substringWithRange:NSMakeRange(i++, 1)]];
          }
       
   }
      NSLog(@"%@",[str substringWithRange:NSMakeRange(index, ans)]);

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
// 2:两数相加
//给出两个 非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
struct ListNode* addTwoNumbers(struct ListNode * l1, struct ListNode * l2) {
       struct ListNode *dummyHead = (struct ListNode *)malloc(sizeof(struct ListNode));
       struct ListNode *p = l1, *q = l2, *curr = dummyHead; int carry = 0;
       while (p != NULL || q != NULL) {
       int x = (p != NULL) ? p->val : 0; int y = (q != NULL) ? q->val : 0;
       int sum = carry + x + y; carry = sum / 10;
       
       curr->next = (struct ListNode *)malloc(sizeof(struct ListNode));
       curr->val = sum%10;
       curr = curr->next;
       if (p != NULL) p = p->next; if (q != NULL) q = q->next;
       }
       if (carry > 0) {
          curr->next = (struct ListNode *)malloc(sizeof(struct ListNode)); }
          return curr;
    }


@end
