//
//  JRHealthKitManager.h
//  Fit
//
//  Created by Jaben on 14-12-12.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JRWeight_Unit) {
    JRWeight_Unit_kg = 0,
    JRWeight_Unit_pount,
};

typedef NS_ENUM(NSInteger, JRPressure_Unit) {
    JRPressure_Unit_mmHg = 0,
    JRPressure_Unit_Pa,
};

typedef NS_ENUM(NSInteger, JRPressure_Type) {
    JRPressure_Type_Systolic = 0,
    JRPressure_Type_Diastolic,
};

typedef NS_ENUM(NSInteger, JRLength_Unit) {
    JRLength_Unit_m = 0,
    JRLength_Unit_ft,
};

typedef void(^JRBooleanResultBlock)(BOOL success, NSError *error);

@interface JRHealthKitManager : NSObject

+ (instancetype)shareManager;

/*======================================================
 Authorize
 /======================================================*/
- (void)getReadAndWriteAuthorizeWithCompleted:(JRBooleanResultBlock)completed;

/*======================================================
 height
 /======================================================*/

- (void)saveHeight:(double)height unit:(JRLength_Unit)unit date:(NSDate *)date;
- (void)saveHeights:(NSArray *)array unit:(JRLength_Unit)unit;

/*======================================================
 weight
 /======================================================*/
- (void)saveLifesenseWeight:(NSDictionary *)weightDic;

- (void)saveWeight:(double)weight unit:(JRWeight_Unit)unit date:(NSDate *)date;
- (void)saveWeights:(NSArray *)array unit:(JRWeight_Unit)unit;

- (void)fetchWeightsFrom:(NSDate *)beginDate toDate:(NSDate *)endDate completed:(void(^)(NSArray *samples,NSError *error))completed;
- (void)fetchFatPercentsFromDate:(NSDate *)beginDate toDate:(NSDate *)endDate completed:(void(^)(NSArray *samples,NSError *error))completed;

/*======================================================
 fat percent
 /======================================================*/
- (void)saveFatPercent:(double)fatPercent date:(NSDate *)date;
- (void)saveFatPercents:(NSArray *)array date:(NSDate *)date;

/*======================================================
 pressure
 /======================================================*/
- (void)saveLifesensePressure:(NSDictionary *)pressureDic;

- (void)saveLifesensePressures:(NSArray *)array unit:(JRPressure_Unit)pressureUnit;
- (void)savePressure:(double)value date:(NSDate *)date unit:(JRPressure_Unit)pressureUnit type:(JRPressure_Type)type;
- (void)savePressures:(NSArray *)array date:(NSDate *)date unit:(JRPressure_Unit)pressureUnit type:(JRPressure_Type)type;

/*======================================================
 activity
 /======================================================*/
- (void)saveLifesenseActivity:(NSDictionary *)activityDic;
@end
