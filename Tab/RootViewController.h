//
//  RootViewController.h
//  JSD
//
//  Created by wangdehuai on 14/12/26.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTableView.h"

@interface RootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)RootTableView *rootTV;

@end
