//
//  PicTableViewCell.h
//  YourNews
//
//  Created by 康凯 on 2018/1/9.
//  Copyright © 2018年 kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *picTitle;
@property (weak, nonatomic) IBOutlet UIImageView *picImage;

@end
