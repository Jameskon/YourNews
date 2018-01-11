//
//  GifTableViewCell.h
//  YourNews
//
//  Created by 康凯 on 2018/1/10.
//  Copyright © 2018年 kai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FLAnimatedImage/FLAnimatedImageView.h>

@interface GifTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *gifTitle;
@property (weak, nonatomic) IBOutlet UIImageView *gifImage;

@end
