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
    NSMutableSet *set = [NSMutableSet new];
    long n = str.length;
    int ans = 0,i =0,j =0 ,index =0 ;
   // while (i <n && j <n) {
        if ([set containsObject:[str substringWithRange:NSMakeRange(j, 1)]]) {
            [set addObject:[str substringWithRange:NSMakeRange(j++, 1)]];
            if (j - i >ans) {
                ans = j-i;
                index = i;
            } else {
                [set removeObject:[str substringWithRange:NSMakeRange(i++, 1)]];
            }
        }
   // }
     NSLog(@"无重复字符的最长子串%@",[str substringWithRange:NSMakeRange(index, ans)]);
    
    //  4:  题目描述
//    计算字符串最后一个单词的长度，单词以空格隔开。
//    输入描述:
//    一行字符串，非空，长度小于5000。
//    输出描述:
//    整数N，最后一个单词的长度。
//    示例1
//    输入
//    hello world
//    输出
//    5
    NSString *sepStr = @"i love beautiful!";
    NSArray *sepArr  = [sepStr componentsSeparatedByString:@" "];
    NSString *str1 = [sepArr lastObject];
    NSLog(@"最后一个单词的长度为%lu",(unsigned long)str1.length);
    
//    5: 题目描述
//    写出一个程序，接受一个由字母和数字组成的字符串，和一个字符，然后输出输入字符串中含有该字符的个数。不区分大小写。
//    输入描述:
//    第一行输入一个有字母和数字以及空格组成的字符串，第二行输入一个字符。
//    输出描述:
//    输出输入字符串中含有该字符的个数。
    [self getDuplicateSubStrCountInCompleteStr:@"aaaabcdef" withSubStr:@"a"];
    [self getDuplicateSubStrLocInCompleteStr:@"aaaabcdef" withSubStr:@"a"];
     //    6:
     //  计算两个字符串的最大公共字串的长度，字符不区分大小写
     //  详细描述
    NSString *astr = @"asdfaS";
    NSString *bstr = @"werAsdfaswer";
    if (astr.length <= bstr.length && [[bstr lowercaseString] containsString:[astr lowercaseString]]) {
        NSLog(@"包含%ld",astr.length);
    }
    // 7:输入一个日期(年月日)，计算是这一年中的第几天
    NSString *dayStr = @"2020-4-19";
    NSArray  *dayArr = [dayStr componentsSeparatedByString:@"-"];
     [self calculateDayByYear:[dayArr[0]intValue] month:[dayArr[1]intValue] day:[dayArr[2]intValue]];
    // 8:输入一个int型整数，按照从右向左的阅读顺序，返回一个不含重复数字的新的整数。
    int intInteger = 673;
    int result = 0;// 翻转后的数字
    while (1) {
        int i = intInteger %10;
        result = result *10 +i;
        intInteger = intInteger/10;
        if (intInteger ==0) {
            break;
        }
    }
    NSLog(@"%d",result);
}

/// 返回第几天
/// @param year 年
/// @param month 月
/// @param day 日
-(int)calculateDayByYear:(int)year  month:(int)month day:(int)day{
    int flag = 0; //
    int days = 0; // 第几天
    if (year %4 == 0 && year %100 !=0) { // 是否是闰年
        flag = 1;
    }
    switch (month -1) {
        case 12:
             days +=31;
        case 11:
             days +=31;
        case 10:
             days +=31;
        case 9:
             days +=30;
        case 8:
             days +=31;
        case 7:
             days +=31;
        case 6:
            days  +=30;
        case 5:
            days  +=31;
        case 4:
            days  +=30;
        case 3:
            days  +=31;
        case 2:
            days  +=28 +flag;
        case 1:
            days  +=31;
       default:
            break;
    }
    
    return days + day;
    
}

//利用替换先把重复元素替换掉,再根据length长度做判断
- (NSInteger )getDuplicateSubStrCountInCompleteStr:(NSString *)completeStr withSubStr:(NSString *)subStr
{
   
   return  completeStr.length - [completeStr stringByReplacingOccurrencesOfString:subStr withString:@""].length;
}

//利用切分先得数组,再根据索引计算
- (NSMutableArray *)getDuplicateSubStrLocInCompleteStr:(NSString *)completeStr withSubStr:(NSString *)subStr
{
    NSArray * separatedStrArr = [completeStr componentsSeparatedByString:subStr];
    NSMutableArray * locMuArr = [[NSMutableArray alloc]init];
    
    NSInteger index = 0;
    for (NSInteger i = 0; i<separatedStrArr.count-1; i++) {
        NSString * separatedStr = separatedStrArr[i];
        index = index + separatedStr.length;
        NSNumber * loc_num = [NSNumber numberWithInteger:index];
        [locMuArr addObject:loc_num];
        index = index+subStr.length;
    }
    return locMuArr;
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
