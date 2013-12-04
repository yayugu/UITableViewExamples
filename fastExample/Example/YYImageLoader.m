//
//  YYImageLoader.m
//  Example
//
//  Created by Yuya Yaguchi on 12/3/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYImageLoader.h"

@implementation YYImageLoader

+ (void)imageWithURL:(NSURL*)url completion:(YYImageLoaderCompletion)completion
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:[NSOperationQueue mainQueue]
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
         if (connectionError) {
             completion(nil, connectionError);
             return;
         }
         UIImage *image = [UIImage imageWithData:data];
         completion(image, nil);
     }];
}

@end
