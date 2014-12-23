//
//  ViewController.h
//  HealthKitTool
//
//  Created by Jaben on 14-12-19.
//  Copyright (c) 2014年 Jaben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)weightButtonAction:(id)sender;
- (IBAction)pressureButtonAction:(id)sender;
- (IBAction)activityAction:(id)sender;
- (IBAction)heightButtonAction:(id)sender;

- (IBAction)getWeightAction:(id)sender;
- (IBAction)getPressureAction:(id)sender;
- (IBAction)getActivityAction:(id)sender;
- (IBAction)getHeightAction:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@end

