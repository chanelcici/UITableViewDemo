//
//  CIViewController.m
//  chanel
//
//  Created by CHANEL on 13-10-2.
//  Copyright (c) 2013年 CHANEL. All rights reserved.
//

#import "CIViewController.h"

@interface CIViewController ()

@end

@implementation CIViewController
@synthesize table, listData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", nil];
    listData = array;
    table.allowsSelection = YES;    //tableview的每行为可选中
    table.separatorStyle = UITableViewCellSeparatorStyleSingleLine; //设置tableview每行之间的分割线,还有SingleLineEtched和none可选
    table.editing = NO;    //设置tableview进入编辑模式(左侧出现删除按钮) yes进入 no不进入
    table.separatorInset = UIEdgeInsetsZero;    //设置分割线从最左边开始(iOS7不是从左边开始)

}

#pragma mark - Table View Data Source Methods

//设置有多少个Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//设置每个section有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listData count];
}

//设置每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

//设置section的header view的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if (section ==0)
		return 80.0f;
	else
		return 30.0f;
}

//设置section的footer view的高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40.0f;
}

//设置指定的section 的 header  的 title，如果这个section header  有返回view，那么title就不起作用了。
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (tableView == table)
	{
		if (section == 0)
		{
			return @"title 1";
		}
		else if (section == 1)
		{
			return @"title 2";
		}
		else
		{
			return nil;
		}
	}
	else
	{
		return nil;
	}
}

/*
//设置指定的 section header 的view，如果没有，这个函数可以不返回view 
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if (section == 0)
	{
        UIView* header = [[[NSBundle mainBundle] loadNibNamed: @"SettingHeaderView" owner: self options: nil] lastObject];
        return header;
    }
    else
        return nil;
}
 */

//设置选中某行的回调函数,前提是cell为可选中属性
//设置方法 TableView.allowsSelection = YES;
//设置选中时的颜色 cell.selectionStyle = UITableViewCellSelectionStyleBlue;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 1) //第二个section不执行操作
	{
		return;
	}
	else if(indexPath.section == 0) //第一个section执行操作
	{
		switch (indexPath.row)
		{
			case 0:
			{
				//选中第0行时要做的操作
                NSLog(@"选中的是第%@行", [NSString stringWithFormat:@"%d", indexPath.row]);
			}
				break;
				
			default:
				break;
		}
	}
	else
        return;
}





//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"tablwView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [listData objectAtIndex:row];
    cell.detailTextLabel.text = [listData objectAtIndex:row];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;    //选中后颜色变化,有none,blue,gray三种
    cell.backgroundColor = [UIColor whiteColor];   //设置 tableview cell的背景颜色
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    /*
     typedef NS_ENUM(NSInteger, UITableViewCellAccessoryType) {
     UITableViewCellAccessoryNone,                   //不显示任何标记
     UITableViewCellAccessoryDisclosureIndicator,    //向右箭头,不响应点击
     UITableViewCellAccessoryDetailDisclosureButton, //向右蓝色圆形按钮,响应点击
     UITableViewCellAccessoryCheckmark               //对勾标记,不响应点击
     };
     */
    UIImage *star = [UIImage imageNamed:@"star"];
    UIImage *mooncake = [UIImage imageNamed:@"mooncake.jpg"];
    cell.imageView.image = star;                    //默认显示在左侧的图片
    cell.imageView.highlightedImage = mooncake;     //被选中后改变左侧图片
    return cell;
}

//响应按下cell右边小箭头按钮 只有蓝色圆形按钮才有此响应方法
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"我是右边小按钮");
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
