//
//  YYImageProcessor.m
//  Example
//
//  Created by Yuya Yaguchi on 12/6/13.
//  Copyright (c) 2013 Yuya Yaguchi. All rights reserved.
//

#import "YYImageProcessor.h"

@implementation YYImageProcessor

+ (UIImage*)commentCellIconImageWithImage:(UIImage*)image
{
    return [self roundedImageWithImage:[self resizedImageWithImage:image maxPixel:100]
                          cornerRadius:10.0
                           borderWidth:1.0];
}

+ (UIImage*)resizedImageWithImage:(UIImage*)image maxPixel:(uint)maxPixel
{
    CGFloat w = image.size.width;
    CGFloat h = image.size.height;
    
    if (w == 0 || h == 0) return nil;
    
    double ratio = (float)w / h;
    bool resized = NO;
    
    if (1 < ratio) {
        if (maxPixel < w) {
            w = maxPixel;
            h = (int)(w / ratio);
            resized = YES;
        }
    } else {
        if (maxPixel < h) {
            h = maxPixel;
            w = (int)(h * ratio);
            resized = YES;
        }
    }
    
    CGContextRef context;
    
    UIGraphicsBeginImageContext(CGSizeMake(w, h));
    context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, 0);
    CGContextRotateCTM(context, 0);
    
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    [image drawInRect:CGRectMake(0, 0, w, h)];
    UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

+ (UIImage*)roundedImageWithImage:(UIImage*)image
                     cornerRadius:(CGFloat)cornerRadius
                      borderWidth:(CGFloat)borderWidth
{
    const CGFloat maxCornerSize = MIN(image.size.width, image.size.height) * 0.5;
    if (cornerRadius > maxCornerSize) {
        cornerRadius = maxCornerSize;
    }
    
    const CGFloat h = image.size.height;
    const CGFloat w = image.size.width;
    CGImageRef cimage = image.CGImage;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h,
                                                 CGImageGetBitsPerComponent(cimage),
                                                 CGImageGetBitsPerComponent(cimage) * 4 * w,
                                                 colorSpace,
                                                 kCGBitmapAlphaInfoMask & kCGImageAlphaNoneSkipLast);
    CGColorSpaceRelease(colorSpace);
    
    // Fill background with white color
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 0, w, h));
    
    [self addRoundedCornerPathWithContext:context width:w height:h cornerRadius:cornerRadius];
    CGContextClip(context);
    
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), cimage);
    
    [self addRoundedCornerPathWithContext:context width:w height:h cornerRadius:cornerRadius];
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    CGContextSetLineWidth(context, borderWidth);
    CGContextStrokePath(context);
    
    CGImageRef clippedImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage *roundedImage = [UIImage imageWithCGImage:clippedImage];
    CGImageRelease(clippedImage);
    return roundedImage;
}

+ (void)addRoundedCornerPathWithContext:(CGContextRef)context width:(CGFloat)w height:(CGFloat)h cornerRadius:(CGFloat)r
{
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, r);
    CGContextAddArcToPoint(context, 0, h, r, h, r);
    CGContextAddArcToPoint(context, w, h, w, h-r, r);
    CGContextAddArcToPoint(context, w, 0, w-r, 0, r);
    CGContextAddArcToPoint(context, 0, 0, 0, r, r);
    CGContextClosePath(context);
}

@end
