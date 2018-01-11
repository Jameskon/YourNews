//
//  PicViewController.m
//  YourNews
//
//  Created by 康凯 on 2017/12/28.
//  Copyright © 2017年 kai. All rights reserved.
//

#import "PicViewController.h"
#import "PicTableViewCell.h"


@interface PicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *picTable;
@property (nonatomic,copy) NSArray *rootArr;
@property UINib *picNib;

@end

@implementation PicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picTable.estimatedRowHeight = 200;
    self.picTable.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSArray *)rootArr{
    if(!_rootArr){
        //    封装URLManager类
        URLManager *urlManager = [URLManager URLManageWithPage:1 andMaxResult:20 andTag:2];
        NSData *jsonData = [urlManager getData];
        //    原始json文件转换成object文件 第一层解析得到最外层得到rootDict
        _rootArr = [[[NSJSONSerialization JSONObjectWithData:jsonData options:(NSJSONReadingMutableContainers) error:nil] valueForKeyPath:@"showapi_res_body"] valueForKeyPath:@"contentlist"];
    }
    return _rootArr;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *re = @"picCell";
    if(!_picNib){
        _picNib = [UINib nibWithNibName:@"PicTableViewCell" bundle:[NSBundle mainBundle]];
        [tableView registerNib:_picNib forCellReuseIdentifier:re];
    }
    
    PicTableViewCell *picCell = [tableView dequeueReusableCellWithIdentifier:re];
    
    if(!picCell){
        picCell = [[PicTableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:re];
    }
    
    NSString *imgstr = [NSString stringWithFormat:@"%@",[self.rootArr[indexPath.row] valueForKeyPath:@"img"]];
    
    [picCell.picImage sd_setImageWithURL:[NSURL URLWithString:imgstr] placeholderImage:nil];
    picCell.picImage.contentMode = UIViewContentModeScaleAspectFit;
    picCell.picTitle.text = [NSString stringWithFormat:@"%@", [self.rootArr[indexPath.row] valueForKeyPath:@"title"]];
    return picCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rootArr.count;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//
//}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
}
    

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return NO;
}

- (void)updateFocusIfNeeded {
    
}

@end
