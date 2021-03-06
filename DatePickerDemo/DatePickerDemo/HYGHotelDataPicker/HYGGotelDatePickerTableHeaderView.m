//
//  HYGGotelDatePickerTableHeaderView.m
//  GoodDoctor
//
//  Created by 李冲 on 2018/9/17.
//  Copyright © 2018年 litingting. All rights reserved.
//

#import "HYGGotelDatePickerTableHeaderView.h"
#import "help.h"

@implementation HYGGotelDatePickerTableHeaderView


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self createView];
    }
    return self;
}
-(void)createView{
    self.contentView.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
    
    
    UILabel *bottomLab = [UILabel new];
    self.titleLab = bottomLab;
    bottomLab.font = HYGBaseFont(16);
    bottomLab.textColor = [[UIColor alloc] initWithRGB:0x333333];
    bottomLab.textAlignment = NSTextAlignmentCenter;
    //add
    [self.contentView addSubview:bottomLab];
    
    
    [bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];
    
    
}

@end
