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
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
             __block UIImage *image = [UIImage imageWithData:data];
             dispatch_async(dispatch_get_main_queue(), ^{
                 completion(image, nil);
                 return;
             });
         });
     }];
}

@end
