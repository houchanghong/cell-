//
//  RootTableViewCell.h
//  JSD
//
//  Created by wangdehuai on 14/12/26.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RootTableViewCellDelegate ;


@interface RootTableViewCell : UITableViewCell

@property(nonatomic)BOOL isShow;

@property(nonatomic,retain)UIButton *imgIconBtn;// 左边的button
@property(nonatomic,retain)UIView *alertView; //遮罩层
@property(nonatomic,retain)UIImageView *imgBG;// 分割线
@property(nonatomic,strong)UILabel *cellTitle;
@property(nonatomic,strong)UILabel *cellSub1;
@property(nonatomic,strong)UILabel *cellSub2;
@property(nonatomic,strong)UILabel *cellState;

@property (nonatomic, retain) UILabel *instructionLabel; // 标的简介
@property (nonatomic, retain) UIButton *instructionBtn;//简介按钮


@property (nonatomic,assign) id<RootTableViewCellDelegate> delegate;
@property (nonatomic,assign) NSInteger index;

@end


@protocol RootTableViewCellDelegate <NSObject>

-(void)cellButtonClick:(NSInteger)index;

@end