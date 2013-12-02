//
//  YYCommentCell.h
//  Example
//
//  Created by Yuya Yaguchi on 12/2/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYComment;

@interface YYCommentCell : UITableViewCell

@property (nonatomic, strong)YYComment *comment;
- (CGFloat)height;

@end
