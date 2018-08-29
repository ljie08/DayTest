//
//  MeViewController.m
//  MoxiLjieApp
//
//  Created by 仙女🎀 on 2018/4/27.
//  Copyright © 2018年 AppleFish. All rights reserved.
//

#import "MeViewController.h"
#import "MarqueeLabel.h"

@interface MeViewController ()
@property (weak, nonatomic) IBOutlet MarqueeLabel *mLab;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"为你翘课的那一天。花落的那一天。教室的那一间 我怎么看不见。消失的下雨天 我好想再淋一遍。没想到 失去的勇气我还留着。好想再问一遍 你会等待还是离开";
    
    UILabel *scrollLab = [[UILabel alloc] init];
    scrollLab.text = string;
    scrollLab.numberOfLines = 0;
    scrollLab.textColor = [UIColor redColor];
    
    MarqueeLabel *label = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 20) duration:15.0 andFadeLength:10.0f];
    [self.view addSubview:label];
    
    label.numberOfLines = 1;
    label.opaque = NO;
    label.enabled = YES;
//    label.textAlignment = UITextAlignmentLeft;
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor blueColor];
    label.text = string;
    
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(scrollTheText) userInfo:nil repeats:NO];
    
    self.mLab.scrollDuration = 25.0;//越大越慢
    self.mLab.fadeLength = 15.0f;
    self.mLab.text = string;
}

- (void)scrollTheText {
    
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

@end
