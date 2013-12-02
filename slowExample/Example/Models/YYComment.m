//
//  YYComment.m
//  Example
//
//  Created by Yuya Yaguchi on 12/3/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYComment.h"

@implementation YYComment

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *sampleDatas = @[@{@"icon_url": @"http://www.gravatar.com/avatar/eba4a40bdae5edfe1589601c050a2b96?d=wavatar&s=1024",
                                   @"name": @"John Doe",
                                   @"text": @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                   },
                                 @{@"icon_url": @"http://www.gravatar.com/avatar/c7bd4055f9990b39f95dc7a665471e92?d=wavatar&s=1024",
                                   @"name": @"Jason Doe",
                                   @"text": @"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                   },
                                 @{@"icon_url": @"http://www.gravatar.com/avatar/41761702e39181c8e142a1bb13a3c727?d=wavatar&s=1024",
                                   @"name": @"Hoge Doe",
                                   @"text": @"Duis aute irure dolor",
                                   },
                                 ];
        NSDictionary *sampleData = sampleDatas[rand() % sampleDatas.count];
        _iconURL = [NSURL URLWithString:sampleData[@"icon_url"]];
        _name = sampleData[@"name"];
        _text = sampleData[@"text"];
    }
    return self;
}

@end
