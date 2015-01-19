//
//  ViewController.m
//  HealthKitTool
//
//  Created by Jaben on 14-12-19.
//  Copyright (c) 2014年 Jaben. All rights reserved.
//

#import "ViewController.h"
#import "JRHealthKitManager.h"
#import "NSDate+Calendar.h"
#import "UIAlertView+Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[JRHealthKitManager shareManager] getReadAndWriteAuthorizeWithCompleted:^(BOOL success, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *title = success?@"授权成功":@"授权失败";
            NSString *errorConent = error?[error description]:@"";
            [UIAlertView showWithTitle:title message:errorConent cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                
            }];
        });
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)weightButtonAction:(id)sender {
    /*
     weightDid -> @{@"weight":weight(kg),@"unit":0,@"fat":fat(%),@"bmi":bmi,@"date":date};
     */
    NSDictionary *weightData = @{
                                   @"weight":@160,
                                   @"fat":@100,
                                   @"unit":@(JRWeight_Unit_kg),
                                   @"bmi":@17,
                                   @"date":[NSDate date],
                                   };
    
    [[JRHealthKitManager shareManager] saveLifesenseWeight:weightData];
    
//    NSMutableArray *weights = [NSMutableArray array];
//    for(int i = 0; i<10; i++) {
//        int value = (arc4random() % 20) + 60;
//        NSDictionary *heightDic = @{
//                                    @"value":@(value),
//                                    @"date":[NSDate dateWithYear:2014 month:12 day:i],
//                                    };
//        [weights addObject:heightDic];
//    }
//    [[JRHealthKitManager shareManager] saveWeights:weights unit:JRWeight_Unit_kg];
}

- (IBAction)pressureButtonAction:(id)sender {
    /*
     pressureDic ->@{@"diaValue":diaValue, @"sysValue":sysValue,@"unit":0,@"heartRate":80,@"date",date};
     */
    NSDictionary *pressureData = @{
                                 @"diaValue":@80,
                                 @"sysValue":@100,
                                 @"unit":@(JRPressure_Unit_mmHg),
                                 @"heartRate":@80,
                                 @"date":[NSDate date],
                                 };
    [[JRHealthKitManager shareManager] saveLifesensePressure:pressureData];
}

- (IBAction)activityAction:(id)sender {
    /*
     pressureDic ->@{@"step":step, @"distance":distance(m),@"unit":0,@"calorie":calorie,@"date",date};
     */
    NSDictionary *activityData = @{
                                   @"step":@160,
                                   @"distance":@2,
                                   @"unit":@(JRLength_Unit_km),
                                   @"calorie":@180,
                                   @"date":[NSDate date],
                                   };
    [[JRHealthKitManager shareManager] saveLifesenseActivity:activityData];
}

- (IBAction)heightButtonAction:(id)sender {
    NSMutableArray *heights = [NSMutableArray array];
    for(int i = 0; i<10; i++) {
        int value = (arc4random() % 10) + 170;
        NSDictionary *heightDic = @{
                                    @"height":@(value),
                                    @"date":[NSDate dateWithYear:2014 month:12 day:i],
                                    };
        [heights addObject:heightDic];
    }
    [[JRHealthKitManager shareManager] saveHeights:heights unit:JRLength_Unit_m];
}

- (IBAction)getWeightAction:(id)sender {
    
    _logTextView.text = @"";
    
    NSDate *now = [NSDate date];
    NSDate *beginDate = [now dateByAddingMonth:-1];
    
//    [[JRHealthKitManager shareManager] fetchWeightsFrom:beginDate toDate:now completed:^(NSArray *samples, NSError *error) {
//        if (error) {
//            NSLog(@"weights fetch error: %@",[error description]);
//        }else {
//            NSLog(@"result = %@",samples);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                _logTextView.text = [samples description];
//            });
//        }
//    }];
    
    [[JRHealthKitManager shareManager] fetchFatPercentsFromDate:beginDate toDate:now completed:^(NSArray *samples, NSError *error) {
        if (error) {
            NSLog(@"weights fetch error: %@",[error description]);
        }else {
            NSLog(@"result = %@",samples);
            dispatch_async(dispatch_get_main_queue(), ^{
                _logTextView.text = [samples description];
            });
        }

    }];
}

- (IBAction)getPressureAction:(id)sender {
}

- (IBAction)getActivityAction:(id)sender {
}

- (IBAction)getHeightAction:(id)sender {
}

@end
