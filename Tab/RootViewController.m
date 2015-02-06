//
//  RootViewController.m
//  JSD
//  首页
//  Created by wangdehuai on 14/12/26.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import "RootViewController.h"
#import "RootTableViewCell.h"

@interface RootViewController ()<RootTableViewCellDelegate>
{
    NSMutableArray *firstArr;
    NSMutableArray *secondArr;
    NSMutableArray *thirdArr;
    NSMutableArray *fourthArr;
    
    NSMutableArray *rootArr;
    NSInteger  lastIndexPath;
    
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"某某某"];
    
    firstArr = [[NSMutableArray alloc] initWithObjects:@"Icon_DingCunBao",@"Cell_Separator_DingCunBao",@"宝宝宝",@"省心省力",@"每月获得利息，到期收回本金",@"可投资", nil];
    secondArr = [[NSMutableArray alloc] initWithObjects:@"Icon_YueXiTong",@"Cell_Separator_YueXiTong",@"月息通",@"最高13.24%",@"每月等额本息汇款，流动性强",@"已售完", nil];
    thirdArr = [[NSMutableArray alloc] initWithObjects:@"Icon_XinShouBiao",@"Cell_Separator_XinShouBiao",@"新手专享",@"轻松理财第一步",@"为首次投资者定制的精选项目",@"可投资", nil];
    
    
    rootArr = [[NSMutableArray alloc] initWithObjects:firstArr,secondArr,thirdArr, nil];

    //表格
    _rootTV = [[RootTableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [_rootTV setDelegate:self];
    [_rootTV setDataSource:self];
    [_rootTV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_rootTV];
    
    lastIndexPath = -1;
}

-(void)cellButtonClick:(NSInteger)index
{
    if (lastIndexPath != -1 && lastIndexPath != index) {
        RootTableViewCell *lastCell = (RootTableViewCell *)[_rootTV cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:lastIndexPath]];
        [lastCell setIsShow:NO];
    }
    
    RootTableViewCell *cell = (RootTableViewCell *)[_rootTV cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]];
    NSString *string = [NSString stringWithFormat:@"%@NA",[rootArr[index] objectAtIndex:1]];
    cell.imgBG.image = [UIImage imageNamed:string];
    [cell setIsShow:!cell.isShow];
    lastIndexPath = index;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if ([tableView isEqual:_rootTV]) {
        return 95;
    }
     return 47;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [rootArr count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cellName";
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[RootTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    [cell.imgIconBtn setImage:[UIImage imageNamed:[rootArr[indexPath.section] objectAtIndex:0]] forState:UIControlStateNormal];

    [cell.imgBG setImage:[UIImage imageNamed:[rootArr[indexPath.section] objectAtIndex:1]]];
    [cell.cellTitle setText:[rootArr[indexPath.section] objectAtIndex:2]];
    [cell.cellSub1 setText:[rootArr[indexPath.section] objectAtIndex:3]];
    [cell.cellSub2 setText:[rootArr[indexPath.section] objectAtIndex:4]];
    [cell.cellState setText:[rootArr[indexPath.section] objectAtIndex:5]];
    [cell.instructionLabel setText:@"工作日期10:30、14:30、\n20:00固定时间发布，其余\n时间与周末随机发布"];
    [cell.instructionBtn setTitle:@"了解定存宝" forState:UIControlStateNormal];
    [cell.instructionBtn addTarget:self action:@selector(knowInfo:) forControlEvents:(UIControlEventTouchUpInside)];
    
    cell.index = indexPath.section;
    cell.delegate = self;

    //如果 已售完 字灰色
    if ([cell.cellState.text isEqualToString:@"已售完"]) {
        [cell.cellState setTextColor:[UIColor grayColor]];
    }
    return cell;
}


-(void)knowInfo:(id)sender
{
    NSLog(@"ddd");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
