//
//  BinaryTree.h
//  LetCodeAlgorithm
//
//  Created by 哈哈 on 2020/5/4.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface BinaryTreeNode : NSObject
@property (nonatomic,assign) NSInteger val;
@property (nonatomic,strong) BinaryTreeNode *leftNode; // 左节点
@property (nonatomic,strong) BinaryTreeNode *rightNode; // 右节点

- (instancetype )initWithVal:(NSInteger )val;
@end

NS_ASSUME_NONNULL_END
