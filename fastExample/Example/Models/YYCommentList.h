//
//  YYCommentList.h
//  Example
//
//  Created by Yuya Yaguchi on 12/3/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YYComment;

@protocol YYCommentListDelegate <NSObject>

- (void)commentListDidLoad;

@end

@interface YYCommentList : NSObject

@property (nonatomic) BOOL loading;

- (instancetype)initWithDelegate:(id<YYCommentListDelegate>)delegate;
- (void)requestSynchronous;
- (void)requestAsynchronous;
- (void)requestMoreSynchronous;
- (void)requestMoreAsynchronous;
- (NSUInteger)count;
- (YYComment*)commentAtIndex:(NSUInteger)index;

@end
