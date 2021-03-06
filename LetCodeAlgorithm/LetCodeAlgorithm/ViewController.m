//
//  ViewController.m
//  LetCodeAlgorithm
//
//  Created by 哈哈 on 2019/10/12.
//  Copyright © 2019 MengHeng. All rights reserved.
//

#import "ViewController.h"
#include <stdio.h>
#import <math.h>
#import <assert.h>
#import "BinaryTreeViewController.h"


struct ListNode {
    int val;
    struct ListNode *next;
};


@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}

- (IBAction)touch:(UIButton *)sender {
    [self presentViewController:[BinaryTreeViewController new] animated:YES completion:nil];

}

-(void)getUrl{
    NSString *urlStr = @"192.168.8080,http://192.148.8083,193.128.8080";
    NSArray *urlArr = [urlStr componentsSeparatedByString:@","];
    
    for (NSString *url in urlArr) {
        NSMutableString *mulStr = [[NSMutableString alloc] init];
        if (![url hasPrefix:@"http://"]) {
            if (![url hasPrefix:@"https://"]) {
                [mulStr appendFormat:@"%@", [NSString stringWithFormat:@"https://%@",url]];
            }
        }
        if ([mulStr isEqualToString:@""]) { // 带http或者https前缀
            [mulStr appendFormat:@"%@", url];
        }
        
        if (![mulStr hasSuffix:@"/"]) {
            [mulStr appendString:@"/"];
        }
        NSLog(@"%@",mulStr);

    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getUrl];
    
    
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
    while (YES) {
        int i = intInteger %10;
        result = result *10 +i;
        intInteger = intInteger/10;
        if (intInteger ==0) {
            break;
        }
    }
    NSLog(@"%d",result);
    // 9:输入一个double数 输出描述: 输出人民币格式
    [self calculateMoneyBy:5];
    // 10:将一个字符中所有出现的数字前后加上符号“*”，其他字符保持不变
    [self addStarWithStr:@"s d a s d a 3 d f 0 f d f 9 8 f d f 3"];
    // 11:自守数是指一个数的平方的尾数等于该数自身的自然数。例如：25^2 = 625，76^2 = 5776，9376^2 = 87909376。请求出n以内的自守数的个数
    [self calculcateInt:10];
    //12: 输入一个整数，将这个整数以字符串的形式逆序输出
   // 程序不考虑负数的情况，若数字含有0，则逆序形式也含有0，如输入为100，则输出为001
    int strInt = 00001;
    NSString *targetStr = [NSString stringWithFormat:@"%d",strInt];
    [self reverseString:targetStr];
    // 13:将一个英文语句以单词为单位逆序排放。例如“I am a boy”，逆序排放后为“boy a am I”
    //所有单词之间用一个空格隔开，语句中除了英文字母外，不再包含其他字符
    [self reverseString:@"I am a boy"];
//    //14:  开发一个坐标计算工具， A表示向左移动，D表示向右移动，W表示向上移动，S表示向下移动。从（0,0）点开始移动，从输入字符串里面读取一些坐标，并将最终输入结果输出到输出文件里面。
//    输入：
//    合法坐标为A(或者D或者W或者S) + 数字（两位以内）
//    坐标之间以;分隔。
//    非法坐标点需要进行丢弃。如AA10;  A1A;  $%$;  YAD; 等。
//    下面是一个简单的例子 如：
//    A10;S20;W10;D30;X;A1A;B10A11;;A10;
//    处理过程：
//    起点（0,0）
//    +   A10   =  （-10,0）
//    +   S20   =  (-10,-20)
//    +   W10  =  (-10,-10)
//    +   D30  =  (20,-10)
//    +   x    =  无效
//    +   A1A   =  无效
//    +   B10A11   =  无效
//    +  一个空 不影响
//    +   A10  =  (10,-10)
//    结果 （10， -10）
    [self calcalateCoordinates:@[@"a10",@"s20",@"w10",@"d30",@"x",@"a70",@"1b1"]];
    /// 15 三数之和
    ///  给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
    [self threeNumber:@[@"1",@"2",@"3",@"4",@"5",@"-3",@"-4",@"-2"]];
    /// 16. 最接近的三数之和
//    给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
//
//    例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
//
//    与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
    int q = [self closeThree:@[@1,@2,@3,@4,@5,@8] target:5];

}

-(int)closeThree:(NSArray *)nums target:(int)target{
    int ans = [nums[0] intValue]+[nums[1] intValue]+[nums[2] intValue];
    for (int i = 0; i <nums.count; i ++) {
        int low = i +1;
        int high = nums.count -1;
        while (low <high) {
            int sum = [nums[i] intValue] +[nums[low] intValue] +[nums[high] intValue];
            if (  abs(target - sum) < abs(target - ans) ){
                ans = sum;
            }
            if (sum >target) {
                high = high -1;
            } else if(sum <target){
                low = low +1;
            } else {
                return ans;
            }
        
        }
    }
    
    
    return ans;
}


int threeSumClosest(int* nums, int numsSize, int target){
    qsort(nums,numsSize,sizeof(nums[0]),cmp);
    int ans = nums[0]+nums[1]+nums[2];
    for(int i=0; i<numsSize; i++){
        int start = i+1,end = numsSize-1;
        while(start<end){
            int sum = nums[start] + nums[end] + nums[i];
            if(abs(target - sum)<abs(target - ans))
                ans = sum;
            if(sum>target)
                end--;
            else if(sum<target)
                start++;
            else return ans;
        }
    }
    return ans;
}

int cmp(const void *a, const void *b)
{
    return *(int*)a - *(int*)b;
}

-(void)threeNumber:(NSArray *)arr{
    for (int i =0 ; i < arr.count; i ++) {
        for (int j = 0; j < arr.count; j ++) {
            for (int k = 0; k <arr.count ; k ++) {
                if ([arr[i] intValue] + [arr[j] intValue] + [arr[k] intValue] == 0) {
                    NSLog(@"%@---%@--%@",arr[i],arr[j],arr[k]);
                }
            }
        }
    }
    
}


-(CGPoint)calcalateCoordinates:(NSArray *)coordsArr{
    int x = 0;
    int y = 0;
    for (int i =0 ; i <coordsArr.count;  i++) {
        if ([[NSString stringWithFormat:@"%@",coordsArr[i]] hasPrefix:@"a"]
            ||[[NSString stringWithFormat:@"%@",coordsArr[i]] hasPrefix:@"s"]
            ||[[NSString stringWithFormat:@"%@",coordsArr[i]] hasPrefix:@"a"]
            ||[[NSString stringWithFormat:@"%@",coordsArr[i]] hasPrefix:@"d"]) {
            int coord = [[[NSString stringWithFormat:@"%@",coordsArr[i]] substringFromIndex:1] intValue];
            NSString *preStr = [NSString stringWithFormat:@"%@",coordsArr[i]];
            if ([preStr hasPrefix:@"a"]) {
                x -= coord;
            } else if ([preStr hasPrefix:@"s"]){
                y -= coord;
            } else if ([preStr hasPrefix:@"w"]){
                y += coord;
            } else if ([preStr hasPrefix:@"d"]){
                x += coord;
            }
        
        }
    }
    CGPoint point = CGPointMake(x, y);
    return point;
}


/// 字符串的反转
/// @param targetStr 目标字符串
-(NSString *)reverseString:(NSString *)targetStr{
    NSMutableString *str = [NSMutableString stringWithCapacity:targetStr.length];
    for (int i = targetStr.length -1; i >=0; i --) {
        [str appendString:[targetStr substringWithRange:NSMakeRange(i, 1)]];
    }
    return  str;
}


-(int )calculcateInt:(int)digital{
    int sum = 0;
    for (int i =0 ; i <digital; i ++) {
        int j = pow(10, f1(i));
        if (i == i*i%j) {
            NSLog(@"%d",i);
            sum +=1;
        }
        
        
    }
    return sum;
}

int f1(int n)    //判断此数是几位数
{
 int i=1;
 for(;n>=10;i++)
  n/=10;
 return i;
}

-(NSMutableString *)addStarWithStr:(NSString *)starStr{
    NSArray *starArr = [starStr componentsSeparatedByString:@" "];
    NSMutableString *targetStr = [NSMutableString new];
    for (int i =0; i < starArr.count; i ++) {
        char strChar = [starStr characterAtIndex:i];

       if (strChar >47 && strChar <58 ){
            [targetStr appendString:[NSString stringWithFormat:@"*%@*",starArr[i]]];

        }   else {
            [targetStr appendString:starArr[i]];
        }
    }
    return targetStr;
}



-(NSMutableString *)calculateMoneyBy:(double)money{
    NSMutableString *moneyStr = [NSMutableString new];
    NSArray *digitalArr = @[@"壹",@"贰",@"叁",@"肆",@"伍",@"陆",@"柒",@"捌",@"玖",@"拾"];
   // NSArray *moneyArr   = @[@"仟",@"万",@"亿",@"元",@"角",@"分",@"零"];
    if (money/10000 > 1) { // 万部分
        [moneyStr appendString:[NSString stringWithFormat:@"%@万",digitalArr[(int)money/10000-1]]];
        money -= (int)money /10000 * 10000;
    }
        
    
    if (money/1000 > 1){
        [moneyStr appendString:[NSString stringWithFormat:@"%@仟",digitalArr[(int)money/1000-1]]];
        money -= (int)money /1000 *1000;

    }
    
    if (money/100 >1){
        [moneyStr appendString:[NSString stringWithFormat:@"%@佰",digitalArr[(int)money/100-1]]];
        money -= (int)money /100 *100;

    } 
    
    if(money/10 >1){
        [moneyStr appendString:[NSString stringWithFormat:@"%@十",digitalArr[(int)money/10-1]]];
        money -= (int)money/10 *10;

    }
        [moneyStr appendString:[NSString stringWithFormat:@"%@",digitalArr[(int)money-1]]];
    
    return moneyStr;
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
