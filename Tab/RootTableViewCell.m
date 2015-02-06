//
//  RootTableViewCell.m
//  JSD
//  首页 自定义 cell
//  Created by wangdehuai on 14/12/26.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;//cell高亮状态
        
        //cell标题
        _cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(75, 20, SCREEN_WIDTH-75-75, 20)];
        [_cellTitle setFont:font16];
        [self addSubview:_cellTitle];
        
        //cell标说明
        _cellSub1 = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_X(_cellTitle), VIEW_Y_H_10(_cellTitle), VIEW_W(_cellTitle), 12)];
        [_cellSub1 setFont:font12];
        [_cellSub1 setTextColor:[UIColor darkGrayColor] ];
        [self addSubview:_cellSub1];
        
        //cell标说明
        _cellSub2 = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_X(_cellTitle), VIEW_Y_H_5(_cellSub1), VIEW_W(_cellTitle), 12)];
        [_cellSub2 setFont:font12];
        [_cellSub2 setTextColor:[UIColor darkGrayColor] ];
        [self addSubview:_cellSub2];
        
        //cell可否投资
        _cellState = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-65, 0, 65, 95)];
        [_cellState setFont:font16];
        [_cellState setTextColor:[UIColor orangeColor]];
        [self addSubview:_cellState];
        
        
        //icon 按钮
        _imgIconBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 95)];
        [_imgIconBtn setBackgroundColor:[UIColor orangeColor]];
        [_imgIconBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //分割线
        _imgBG = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 8, 95)];
        [self addSubview:_imgBG];
        
        
        //遮罩层
//        _alertView = [[UIView alloc] initWithFrame:CGRectMake(-SCREEN_WIDTH-VIEW_X(_imgBG), 0, SCREEN_WIDTH-VIEW_X(_imgBG), 95)];
        _alertView = [[UIView alloc] init];
        _alertView.frame = CGRectMake(-SCREEN_WIDTH-VIEW_X(_imgBG), 0, SCREEN_WIDTH-VIEW_X(_imgBG), 95);
        [_alertView setAlpha:0.9];
        [_alertView setBackgroundColor:[UIColor darkGrayColor] ];
     
        [self insertSubview:_imgIconBtn aboveSubview:_alertView];
        
        //标说明
        _instructionLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, _alertView.frame.size.width /2+ 10, VIEW_H(_alertView))];
        _instructionLabel.font = [UIFont systemFontOfSize:12.0];
        _instructionLabel.numberOfLines = 0;
        _instructionLabel.textColor = [UIColor whiteColor];
        [_alertView addSubview:_instructionLabel];
        
        //标的按钮
        _instructionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _instructionBtn.frame = CGRectMake(VIEW_X_W_20(_instructionLabel), 30, 80 , 35);
        _instructionBtn.layer.cornerRadius = 5;
        _instructionBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _instructionBtn.layer.borderWidth = 1;
        _instructionBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        [_alertView addSubview:_instructionBtn];
    }
    return self;
}

-(void)btnClick:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(cellButtonClick:)]) {
        [_delegate cellButtonClick:self.index];
    }
}
-(void)setIsShow:(BOOL)isShow
{
    _isShow = isShow;
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.75 animations:^{
        if (isShow) {
            _alertView.frame = CGRectMake(_imgIconBtn.frame.size.width+self.frame.origin.x, 0, self.frame.size.width-(_imgIconBtn.frame.size.width+self.frame.origin.x), self.frame.size.height);
            [self addSubview:_alertView];
            [self  bringSubviewToFront:_alertView];
        }else
        {
            _alertView.frame = _imgIconBtn.frame;
        }
        
    } completion:^(BOOL isFinish){
        if (!isShow) {
            [_alertView removeFromSuperview];
        }
    }];
    [UIView commitAnimations];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
