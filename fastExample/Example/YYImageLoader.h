//
//  YYImageLoader.h
//  Example
//
//  Created by Yuya Yaguchi on 12/3/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YYImageLoaderCompletion)(UIImage *image, NSError *error);

@interface YYImageLoader : NSObject

+ (void)imageWithURL:(NSURL*)url completion:(YYImageLoaderCompletion)completion;

@end
