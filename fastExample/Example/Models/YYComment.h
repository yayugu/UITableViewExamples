//
//  YYComment.h
//  Example
//
//  Created by Yuya Yaguchi on 12/3/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYComment : NSObject

@property (nonatomic, readonly)NSURL *iconURL;
@property (nonatomic, readonly)NSString *name;
@property (nonatomic, readonly)NSString *text;

@end
