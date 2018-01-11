//
//  TextTableViewCell.h
//  YourNews
//
//  Created by 康凯 on 2018/1/2.
//  Copyright © 2018年 kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *text;

@end
