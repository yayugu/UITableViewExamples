//
//  YYCommentCell.m
//  Example
//
//  Created by Yuya Yaguchi on 12/2/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYCommentCell.h"
#import "YYComment.h"
#import "YYImageLoader.h"

const static CGFloat YYCommentCellBottomPadding = 10.0;

@interface YYCommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *commentText;

@end

@implementation YYCommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setComment:(YYComment *)comment
{
    _comment = comment;
    _name.text = comment.name;
    _commentText.text = comment.text;
    
    _icon.image = nil;
    NSURL *url = comment.iconURL;
    [YYImageLoader commentCellImageWithURL:url completion:^(UIImage *image, NSError *error) {
        if (error || ![url isEqual:_comment.iconURL]) return;
        _icon.image = image;
    }];
}

- (CGFloat)height
{
    return _commentText.frame.origin.y + _commentText.frame.size.height + YYCommentCellBottomPadding;
}

@end
