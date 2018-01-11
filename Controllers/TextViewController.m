//
//  TextViewController.m
//  YourNews
//
//  Created by 康凯 on 2017/12/28.
//  Copyright © 2017年 kai. All rights reserved.
//

#import "TextViewController.h"
#import "TextTableViewCell.h"

@interface TextViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *textTab;
@property (nonatomic,copy) NSArray *rootArr;
@property UINib *textNib;

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"文本";
    self.navigationController.title = @"文本";
    // Do any additional setup after loading the view.
    self.textTab.estimatedRowHeight = 200;
    self.textTab.rowHeight = UITableViewAutomaticDimension;
}

-(NSArray *)rootArr{
    if(!_rootArr){
//    封装URLManager类
    URLManager *urlManager = [URLManager URLManageWithPage:1 andMaxResult:20 andTag:1];
    NSData *rootData = [urlManager getData];
    _rootArr = [[[NSJSONSerialization JSONObjectWithData:rootData options:NSJSONReadingMutableLeaves error:nil] valueForKeyPath:@"showapi_res_body"] valueForKeyPath:@"contentlist"];
    }
    return _rootArr;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *re = @"textCell";
//    UITableViewCell *textCell = [tableView dequeueReusableCellWithIdentifier:re];
    if(!_textNib){
        _textNib = [UINib nibWithNibName:@"TextTableViewCell" bundle:[NSBundle mainBundle]];
        [tableView registerNib:_textNib forCellReuseIdentifier:re];
    }
    
    TextTableViewCell *textCell = [tableView dequeueReusableCellWithIdentifier:re];
    
    if(!textCell){
    textCell = [[TextTableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:re];
    }
    textCell.text.text = [NSString stringWithFormat:@"%@", [self.rootArr[indexPath.row] valueForKeyPath:@"text"]];
    textCell.title.text = [NSString stringWithFormat:@"%@", [self.rootArr[indexPath.row] valueForKeyPath:@"title"]];
    return textCell;
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
//    <#code#>
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

//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}

- (void)updateFocusIfNeeded {
    
}

@end
