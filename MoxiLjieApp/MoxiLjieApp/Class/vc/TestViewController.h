//
//  TestViewController.h
//  MoxiLjieApp
//
//  Created by 仙女🎀 on 2018/5/17.
//  Copyright © 2018年 AppleFish. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^TestBlock)(NSString *title);

@interface TestViewController : BaseViewController

@property (nonatomic) TestBlock testblock;

@end
