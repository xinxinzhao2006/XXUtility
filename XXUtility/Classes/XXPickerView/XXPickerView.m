//
//  XXPickerView.m
//  Unity-iPhone
//
//  Created by Aranion on 2018/4/9.
//

#import "XXPickerView.h"
#import "XXMacro.h"
#import "XXTollClass.h"
#import "UIView+XXView.h"
#import "UILabel+XXLabel.h"
#import "UIButton+XXButton.h"

@interface XXPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) XXPickerViewBlock block ;
@property (strong, nonatomic) UIPickerView *pickerView ;
@property (strong, nonatomic) NSMutableArray *arrData ;
@property (strong, nonatomic) NSMutableArray *arrSelectData ;

@property (strong, nonatomic) UIButton *btnLeft ;
@property (strong, nonatomic) UIButton *btnRight ;
@property (strong, nonatomic) UILabel *lblTitle ;

@end

@implementation XXPickerView

- (instancetype)initWithFrame:(CGRect)frame andType:(XXPickerViewType)type data:(NSArray *)arr block:(XXPickerViewBlock)block;
{
    if (self = [super initWithFrame:frame])
    {
        [self createUI];
        
        if(block)
        {
            self.block = [block copy];
        }
        if (!kIsEmptyArr(arr))
        {
            self.arrData = [NSMutableArray arrayWithArray:arr];
            
            // 初始选中数组
            self.arrSelectData = [NSMutableArray new];
            for (NSArray *arr in self.arrData)
            {
                [self.arrSelectData addObject:arr[0]];
            }
            
            if (type == XXPickerViewDefault)
            {
                [self addSubview:self.pickerView];
            }
            
        }
    }
    
    return self;
}
- (void)createUI
{
    self.backgroundColor = kColor_White;
    self.tintColor = [UIColor blackColor];
    
    self.btnLeft = [XXTollClass getButtonInitWithFrame:kFrame(10, 5, 40, 30) cornerRadius:0 imageName:nil bgImg:nil andTitle:@"取消" target:self action:@selector(btnAction:)];
    self.btnLeft.tag = 0;
    self.btnLeft.xx_titleColor = self.tintColor;
    [self addSubview:self.btnLeft];
    
    self.btnRight= [XXTollClass getButtonInitWithFrame:kFrame(self.xx_width-50, 5, 40, 30) cornerRadius:0 imageName:nil bgImg:nil andTitle:@"确定" target:self action:@selector(btnAction:)];
    self.btnRight.tag = 1;
    self.btnRight.xx_titleColor = self.tintColor;
    [self addSubview:self.btnRight];
    
    self.lblTitle = [[UILabel alloc] xx_initWithFrame:kFrame(50, 5, self.xx_width-100, 30) title:@"" fontSize:15 color:self.tintColor];
    [self addSubview:self.lblTitle];
    
}
#pragma mark - action
- (void)btnAction:(UIButton *)sender
{
    NSString *selectStr = @"";
    for (NSString *str in self.arrSelectData)
    {
        selectStr = [NSString stringWithFormat:@"%@%@",selectStr,str];
    }
    
    self.block(sender.tag, self.arrSelectData,selectStr);
}

#pragma mark - pickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.arrSelectData replaceObjectAtIndex:component withObject:self.arrData[component][row]];
}
#pragma mark - pickerViewDataSouce
//返回有几列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.arrData.count;
}
//返回指定列的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *arr = self.arrData[component];
    return  arr.count;
}
//显示的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *str =  self.arrData[component][row];
    
    return str;
    
}
#pragma mark - set

- (void)setRightColor:(UIColor *)rightColor
{
    _rightColor = rightColor;
    self.btnRight.xx_titleColor = rightColor;
}
- (void)setLeftColor:(UIColor *)leftColor
{
    _leftColor = leftColor;
    self.btnLeft.xx_titleColor = leftColor;
}
- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    self.btnRight.xx_titleColor = tintColor;
    self.btnLeft.xx_titleColor = tintColor;
    self.lblTitle.textColor = tintColor;
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.lblTitle.text = title;
}
- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    self.btnLeft.xx_title = leftTitle;
}
-(void)setRightTitle:(NSString *)rightTitle
{
    _rightTitle = rightTitle;
    self.btnRight.xx_title = rightTitle;
}
#pragma mark - get
- (UIPickerView *)pickerView
{
    if(_pickerView == nil)
    {
        _pickerView = [UIPickerView new];
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 40, self.xx_width, self.xx_height-40)];
        _pickerView.backgroundColor = [UIColor whiteColor];
        
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    
    return _pickerView;
}


@end
