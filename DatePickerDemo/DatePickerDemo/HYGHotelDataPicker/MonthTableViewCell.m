
//
//  MonthTableViewCell.m
//  BJTResearch
//
//  Created by yunlong on 17/5/12.
//  Copyright © 2017年 yunlong. All rights reserved.
//

#import "MonthTableViewCell.h"
#import "MonthModel.h"
#import "DayCollectionViewCell.h"
#import "help.h"

@interface MonthTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UILabel *dateLabel;
@end
@implementation MonthTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *CellID = @"MonthTableViewCellID";
    MonthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell==nil) {
        cell = [[MonthTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellID];
        
    }
    cell.userInteractionEnabled = YES;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self setContentView];
    }
    return self;
}

- (void)setContentView{
    self.contentView.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];

//    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 9)];
//    lineView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
//    [self.contentView addSubview:lineView];
    
//    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 48  )];
//    _dateLabel.textAlignment = NSTextAlignmentCenter;
//    _dateLabel.font = [UIFont systemFontOfSize:20];
//    [self.contentView addSubview:_dateLabel];
    [self.contentView addSubview:self.collectionView];
    
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.left.equalTo(self.contentView.mas_left).with.offset(8);
        make.right.equalTo(self.contentView.mas_right).with.offset(-8);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];
    
}

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.itemSize =  CGSizeMake(([UIScreen mainScreen].bounds.size.width - 16)/7, 60);
        //CGRectMake(8, 0, [UIScreen mainScreen].bounds.size.width - 16, 360)
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.bounces = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.layer.cornerRadius = 4;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[DayCollectionViewCell class] forCellWithReuseIdentifier:@"DayCollectionViewCellID"];
        
    }
    return _collectionView;
}


#pragma mark - 设置内容
- (void)setModel:(MonthModel *)model{
    _model = model;
    [self.collectionView reloadData];
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _model.cellNum;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DayCollectionViewCellID" forIndexPath:indexPath];
    
    if ((indexPath.row < _model.cellStartNum) || (indexPath.row >= (_model.days.count + _model.cellStartNum))) {
        cell.model = nil;
    }else{
        DayModel *model = _model.days[indexPath.row - _model.cellStartNum];
        cell.model = model;
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ((indexPath.row < _model.cellStartNum) || (indexPath.row >= (_model.days.count + _model.cellStartNum))) {
        return;
    }else{
        DayModel *model = _model.days[indexPath.row - _model.cellStartNum];
        
        if (model.state == DayModelStateUnable) {
            //当前日期不可以选择
            return;
        }
        if (self.selectedDay) {
            self.selectedDay(model);
        }
    }
    
}

@end
