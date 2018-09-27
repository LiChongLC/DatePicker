//
//  UIColorExtension.h
//  KR121App
//
//  Created by Lex Lee on 14/12/20.
//  Copyright (c) 2014年 KUNROU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (RGB)

+(instancetype)colorWithRGB:(uint32_t) rgb;

- (UIColor *)initWithRGB:(uint32_t) rgb;

@end

