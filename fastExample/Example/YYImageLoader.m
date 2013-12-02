//
//  YYImageLoader.m
//  Example
//
//  Created by Yuya Yaguchi on 12/3/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYImageLoader.h"

@implementation YYImageLoader

+ (UIImage*)imageWithURL:(NSURL*)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

@end
