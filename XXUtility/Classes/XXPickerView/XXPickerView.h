//
//  XXPickerView.h
//  Unity-iPhone
//
//  Created by Aranion on 2018/4/9.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XXPickerViewType) {
    
    XXPickerViewDefault = 0,
    XXPickerViewProvince = 1,
    XXPickerViewProvinceCity = 2,
    XXPickerViewProvinceCityArea = 3,
    XXPickerViewYear = 4,
    XXPickerViewYearMonth = 5,
    XXPickerViewYearMonthDay = 6,
    XXPickerViewHoursMinuteSecond = 7,
    XXPickerViewYearMonthDayHours = 8,
    XXPickerViewYearMonthDayHoursMinute = 9,
    XXPickerViewYearMonthDayHoursMinuteSecond = 10,
    
};

typedef void(^XXPickerViewBlock)(NSInteger num,NSMutableArray *arr,NSString *selectStr);

@interface XXPickerView : UIView

@property (strong, nonatomic) UIColor * tintColor;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *leftTitle;
@property (copy, nonatomic) NSString *rightTitle;
@property (copy, nonatomic) UIColor *leftColor;
@property (copy, nonatomic) UIColor *rightColor;

/**
 初始化

 @param frame frame
 @param type 类型
 @param arr 数据
 @param block 回调 0取消 1确定 ， @[@"",@""...]
 @return 实例化对象
 */
- (instancetype)initWithFrame:(CGRect)frame andType:(XXPickerViewType)type data:(NSArray *)arr block:(XXPickerViewBlock)block;

@end
