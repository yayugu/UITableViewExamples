//
//  YYCommentCellLayout.m
//  Example
//
//  Created by Yuya Yaguchi on 12/6/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYCommentCellLayout.h"
#import "YYComment.h"

static const CGFloat YYCommentCellLayoutHeightMinimum = 70;
static const CGFloat YYCommentCellLayoutTopPadding = 10;
static const CGFloat YYCommentCellLayoutBottomPadding = 10;
static const CGFloat YYCommentCellLayoutNameCommentTextMargin = 10;
static const CGFloat YYCommentCellLayoutTextLeftPadding = 70;
static const CGFloat YYCommentCellLayoutTextRightPadding = 10;

@interface YYCommentCellLayout ()

@property (nonatomic, strong) YYComment *comment;
@property (nonatomic) CGFloat cellWidth;

@end

@implementation YYCommentCellLayout

- (instancetype)initWithComment:(YYComment*)comment cellWidth:(CGFloat)cellWidth
{
    self = [super init];
    if (self) {
        _comment = comment;
        _cellWidth = cellWidth;
    }
    return self;
}

- (CGFloat)height
{
    CGFloat calculateHeight =
        YYCommentCellLayoutTopPadding
        + [self nameSize].height
        + YYCommentCellLayoutNameCommentTextMargin
        + [self commentTextSize].height
        + YYCommentCellLayoutBottomPadding;
    return MAX(calculateHeight, YYCommentCellLayoutHeightMinimum);
}

- (CGRect)nameRect
{
    return (CGRect) {
        .origin.x = YYCommentCellLayoutTextLeftPadding,
        .origin.y = YYCommentCellLayoutTopPadding,
        .size = [self nameSize],
    };
}

- (CGRect)commentTextRect
{
    return (CGRect) {
        .origin.x = YYCommentCellLayoutTextLeftPadding,
        .origin.y = YYCommentCellLayoutTopPadding + [self nameSize].height + YYCommentCellLayoutNameCommentTextMargin,
        .size = [self commentTextSize],
    };
}

# pragma mark - Internals

- (CGSize)nameSize
{
    return (CGSize) {
        .width = _cellWidth - YYCommentCellLayoutTextLeftPadding - YYCommentCellLayoutTextRightPadding,
        .height = 15.0,
    };
}

- (CGSize)commentTextSize
{
    CGSize sizeMax = (CGSize) {
        .width = _cellWidth - YYCommentCellLayoutTextLeftPadding - YYCommentCellLayoutTextRightPadding,
        .height = CGFLOAT_MAX,
    };
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:15.0]};
    return [_comment.text boundingRectWithSize:sizeMax options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end
