//
//  HomeViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/10/10.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *anyBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (nonatomic, strong) NSString *dayStr;//天
@property (nonatomic, strong) NSString *hourStr;//时
@property (nonatomic, strong) NSString *minuteStr;//分
@property (nonatomic, strong) NSString *secondStr;//秒
@property (nonatomic, assign) NSInteger showType;//倒计时显示类型。1为6月14之前，显示蓝色；2为6月14当天，显示黄色；3为比赛开始之后，根据后台返回的图显示。默认为1

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.layer.masksToBounds = YES;
    self.label.layer.cornerRadius = 10;
    self.label.layer.borderColor = [UIColor redColor].CGColor;
    
    NSString *str = @"abc";
    NSString *abc = [str copy];
    NSLog(@"%X", abc);
    abc = [str mutableCopy];
    NSLog(@"%X", abc);
    abc = [abc stringByAppendingString:@""];
    
    NSMutableString *mstr = [str stringByAppendingString:@"ef"];
    NSMutableString *mabc = [mstr mutableCopy];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIImage *image = [UIImage imageNamed:@"down_white"];
    image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [self.anyBtn setBackgroundImage:image forState:UIControlStateNormal];
    self.anyBtn.tintColor = [UIColor redColor];
}

- (IBAction)selectOrNo:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        button.backgroundColor = [UIColor redColor];
        self.loginBtn.enabled = YES;
        self.loginBtn.backgroundColor = [UIColor blueColor];
    } else {
        button.backgroundColor = [UIColor lightGrayColor];
        self.loginBtn.enabled = NO;
        self.loginBtn.backgroundColor = [UIColor lightGrayColor];
    }
    
    NSString *phone = @"telephone";
    NSString *myStr = @"time";
    
    NSMutableArray *array = [NSMutableArray array];
    /** 遍历 */
    for(int i =0; i < [myStr length]; i++)
    {
        [array addObject:[myStr substringWithRange:NSMakeRange(i, 1)]];
    }
    /** 排序 */
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    /** 转换 */
    myStr = [[sortedArray componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSLog(@"str = %@", myStr);
    
    int ascllCode = [phone characterAtIndex:0];
    NSLog(@"str = %@", myStr);
}

- (IBAction)login:(id)sender {
    NSLog(@"hhhhhha");
    TestViewController *vc = [[TestViewController alloc] init];
    vc.testblock = ^(NSString *title) {
        NSLog(@" ------- %@", title);
    };
    [self.navigationController pushViewController:vc animated:YES];
    
    NSString *time = @"1526613365";
    
    NSDateComponents *date = [LJUtil dateFromNowToFutureTime:time];
//    NSString *cha = [NSString stringWithFormat:@"%zd - %zd - %zd - %zd", date.day, date.hour, date.minute, date.second];
    self.dayStr = [NSString stringWithFormat:@"%ld", date.day];
    self.hourStr = [NSString stringWithFormat:@"%ld", date.hour];
    self.minuteStr = [NSString stringWithFormat:@"%ld", date. minute];
    self.secondStr = [NSString stringWithFormat:@"%ld", date.second];
    
    if (date.day <= 0 && date.hour <= 0 && date.minute <= 0 && date.second <= 0) {//23点之后，比赛已经开始
        
        NSLog(@"%ld天 - %ld时 - %ld分 - %ld秒", date.day, date.hour, date.minute, date.second);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
