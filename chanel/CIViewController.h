//
//  CIViewController.h
//  chanel
//
//  Created by CHANEL on 13-10-2.
//  Copyright (c) 2013年 CHANEL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSArray *listData;

@end
