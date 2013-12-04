//
//  YYCommentList.m
//  Example
//
//  Created by Yuya Yaguchi on 12/3/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYCommentList.h"
#import "YYComment.h"

@interface YYCommentList ()

@property (nonatomic, weak) id<YYCommentListDelegate> delegate;
@property (nonatomic, strong) NSArray *comments;

@end

@implementation YYCommentList

- (instancetype)initWithDelegate:(id<YYCommentListDelegate>)delegate
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _comments = @[];
        _loading = NO;
    }
    return self;
}

- (void)requestSynchronous
{
    sleep(1);
    _comments = @[];
    [self addComments];
}

- (void)requestAsynchronous
{
    _loading = YES;
    [self performSelector:@selector(requestAsynchronousDone) withObject:self afterDelay:1.0];
}

- (void)requestMoreSynchronous
{
    [self addComments];
}

- (void)requestMoreAsynchronous
{
    _loading = YES;
    [self performSelector:@selector(requestMoreAsynchronousDone) withObject:self afterDelay:1.0];
}

- (NSUInteger)count
{
    return _comments.count;
}

- (YYComment*)commentAtIndex:(NSUInteger)index
{
    return _comments[index];
}

#pragma mark - Internals

- (void)addComments
{
    NSMutableArray *newComments = [NSMutableArray arrayWithArray:_comments];
    for (int i = 0; i < 20; i++) {
        [newComments addObject:[[YYComment alloc] init]];
    }
    _comments = newComments;
}

- (void)requestAsynchronousDone
{
    _comments = @[];
    [self addComments];
    [_delegate commentListDidLoad];
    _loading = NO;
}

- (void)requestMoreAsynchronousDone
{
    [self addComments];
    [_delegate commentListDidLoad];
    _loading = NO;
}

@end
