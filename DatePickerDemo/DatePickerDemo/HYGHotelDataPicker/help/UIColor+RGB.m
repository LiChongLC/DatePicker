//
//  UIColorExtension.m
//  KR121App
//
//  Created by Lex Lee on 14/12/20.
//  Copyright (c) 2014年 KUNROU. All rights reserved.
//

#import "UIColor+RGB.h"
@implementation UIColor (RGB)

+(instancetype)colorWithRGB:(uint32_t)rgb{
    return [[self alloc] initWithRGB:rgb];
}

- (UIColor *)initWithRGB:(uint32_t) rgb{
    return [[UIColor alloc] initWithRed: (CGFloat) (((rgb & 0xFF0000) >> 16) / 255.0)
                                  green: (CGFloat) (((rgb & 0x00FF00) >> 8) / 255.0)
                                   blue: (CGFloat) ((rgb & 0x0000FF) / 255.0)
                                  alpha: (CGFloat) 1.0];
}

@end

