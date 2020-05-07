//
//  BinaryTreeViewController.m
//  LetCodeAlgorithm
//
//  Created by 哈哈 on 2020/5/4.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "BinaryTreeViewController.h"
#import "BinaryTreeNode.h"

@interface BinaryTreeViewController ()
@property (nonatomic,strong)  NSMutableArray *dataArr;
@end

@implementation BinaryTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    BinaryTreeNode *one = [[BinaryTreeNode alloc]initWithVal:4];
    one.leftNode = [[BinaryTreeNode alloc]initWithVal:2];
    one.rightNode = [[BinaryTreeNode alloc]initWithVal:7];
    
    BinaryTreeNode *two = one.leftNode;
    two.leftNode = [[BinaryTreeNode alloc]initWithVal:1];
    two.rightNode = [[BinaryTreeNode alloc]initWithVal:3];

    BinaryTreeNode *there = one.rightNode;
    there.leftNode = [[BinaryTreeNode alloc]initWithVal:6];
    there.rightNode = [[BinaryTreeNode alloc]initWithVal:9];
    
    NSMutableArray *arr = [NSMutableArray new];
    self.dataArr = arr;
    [self preorderTravelsal:one];
    
}


/// 前序遍历（递归）
/// @param node 二叉树
-(void)preorderTravelsal:(BinaryTreeNode *)node {
    if (node.val == nil) {
        return;
    }
    [self preorderTravelsal:node.leftNode];
    [self preorderTravelsal:node.rightNode];
    [self.dataArr addObject:node];

}

@end
