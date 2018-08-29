//
//  TestViewController.m
//  MoxiLjieApp
//
//  Created by 仙女🎀 on 2018/5/17.
//  Copyright © 2018年 AppleFish. All rights reserved.
//

#import "TestViewController.h"
#import "CountDownBtn.h"

@interface TestViewController () {
    NSTimer *_timer;
    CGFloat _chaTime;//时间差
    CGFloat _passTime;//已过几秒
}

@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIButton *countdown;

//
@property (strong, nonatomic) IBOutlet UIView *testLab;
@property (weak, nonatomic) IBOutlet CountDownBtn *testBtn;

@end

@implementation TestViewController

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if (self.testblock != nil) {
        self.testblock(@"hhhhatest");
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.testBtn endCountDown];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chaTime = 0.0f;
    _passTime = 0.0f;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"hahaha"];
    
    NSRange range = NSMakeRange(0, attrStr.length);
    
    // 文字中加图片
    NSTextAttachment *attachment=[[NSTextAttachment alloc] initWithData:nil ofType:nil];
    
    UIImage *img=[UIImage imageNamed:@"ha.png"];
    attachment.image=img;
    attachment.bounds=CGRectMake(10, 10, 100, 100);
    [attrStr addAttribute:NSAttachmentAttributeName value:attachment range:range];
    
    UILabel *aLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, Screen_Width - 20, Screen_Height - 20)];
    aLab.attributedText = attrStr;
    aLab.backgroundColor = [UIColor redColor];
//    [self.view addSubview:aLab];
    
//    [self setupCountBtn];
    [self setupBtn];
}

- (void)setupBtn {
    self.testBtn.countNum = 59;
    self.testBtn.bgColor = [UIColor redColor];
    self.testBtn.disabledBgColor = [UIColor lightGrayColor];
    self.testBtn.fontSize = 14;
    [self.testBtn initDefault];
    [self.testBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    __weak CountDownBtn *mybtn = self.testBtn;
    self.testBtn.btnBlock = ^{
        [mybtn setTitle:[NSString stringWithFormat:@"59s后重试"] forState:UIControlStateNormal];
        [mybtn beginCountDown];
    };
    self.testBtn.countdowningBlock = ^(NSInteger countdown) {
        [mybtn setTitle:[NSString stringWithFormat:@"%lds后重试", countdown] forState:UIControlStateNormal];
    };
    self.testBtn.completionBlock = ^{
        [mybtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    };
}

- (void)setupCountBtn {
    CountDownBtn *button = [[CountDownBtn alloc] init];
    button.frame = CGRectMake(50, Screen_Height - 100, Screen_Width - 100, 50);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    button.countNum = 59;
    button.bgColor = [UIColor redColor];
    button.disabledBgColor = [UIColor lightGrayColor];
    button.fontSize = 14;
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    __weak CountDownBtn *mybtn = button;
//    @weakSelf(self);
    button.btnBlock = ^{
//        [weakSelf showWaiting];
        [mybtn setTitle:[NSString stringWithFormat:@"59s后重试"] forState:UIControlStateNormal];
        [mybtn beginCountDown];
    };
    button.countdowningBlock = ^(NSInteger countdown) {
        [mybtn setTitle:[NSString stringWithFormat:@"%lds后重试", countdown] forState:UIControlStateNormal];
    };
    button.completionBlock = ^{
        [mybtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    };
    
    [self.view addSubview:button];
}

- (IBAction)coundownAction:(id)sender {
    
    //当前时间
    NSString *currentStr = [LJUtil getNowDateTimeString];//获取当前时间戳
    NSDate *currentDate = [LJUtil dateStrToDate:currentStr];//时间戳转date
    //结束时间5月24日0点0分
    NSDate *endDate = [LJUtil dateStrToDate:@"1527064470"];
    
    _chaTime = [endDate timeIntervalSinceDate:currentDate]*1000;
    if (_chaTime != 0) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(timeCountDown) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    }
    
    NSLog(@"..");
}

- (void)timeCountDown {
    _passTime += 100.0;
    DateCountDown *down = [LJUtil getCountDownWithTimeInterval:_chaTime passTime:_passTime];
    self.timeLab.text = [NSString stringWithFormat:@"%@天 : %@时 : %@分 : %@秒 :%@毫秒", down.day, down.hour, down.minute, down.second, down.millionsecond];
    NSLog(@"%@", self.timeLab.text);
}

- (void)dealloc {
    
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
