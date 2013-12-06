//
//  YYCommentCellLayout.h
//  Example
//
//  Created by Yuya Yaguchi on 12/6/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYComment;

@interface YYCommentCellLayout : NSObject

- (instancetype)initWithComment:(YYComment*)comment cellWidth:(CGFloat)cellWidth;
- (CGFloat)height;
- (CGRect)nameRect;
- (CGRect)commentTextRect;

@end
