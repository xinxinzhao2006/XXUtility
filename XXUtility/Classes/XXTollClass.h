//
//  XXTollClass.h
//  Xiang_user
//
//  Created by 小新 on 16/7/30.
//  Copyright © 2016年 小新. All rights reserved.
//
// 必备框架============================================
// #import <AFNetworking.h>    #import <SDImageCache.h>


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>


/*
 
typedef enum _TTGState {
    TTGStateOK  = 0,
    TTGStateError,
    TTGStateUnknow
} TTGState;
 
*/

typedef void(^MyQueue)();

typedef void(^ProgressBlock)(id progress);
typedef void(^SuccessBlock)(id success);
typedef void(^FailureBlock)(id failure);
typedef void(^payBlock)(NSInteger num);
typedef void(^isCanUseBlock)(NSInteger num);

@interface XXTollClass : NSObject

+ (BOOL)checkOperationAuthorizationWithUrl:(NSString *)urlString arr:(NSArray *)arr;

+(instancetype)Shared;

// 获取IP地址
+ (NSString *)getIPAddress:(BOOL)preferIPv4;

// 获取UUID
+ (NSString *)getUUID;
// 获取GUID
+ (NSString *)getGUID;
// 获取手机型号
+ (NSString*)iphoneType;
// 获取当前控制器
+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;

/**
 系统自带分享图片或者文件
 
 @param type 1为图片 2为文件
 @param name 名字
 */

+(void)shareSystemItemsWithType:(NSInteger)type andImgnameOrFilename:(NSString*)name andviewcontroll:(UIViewController *)controll success:(SuccessBlock)success failure:(FailureBlock)failure;


#pragma mark - 基础控件
+ (UIViewController *)getCurrentVC;



+ (UIButton *)getButtonInitWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius imageName:(NSString *)imageName bgImg:(NSString *)bgimg andTitle:(NSString *)title  target:(id)target action:(SEL)action;
/**
 *  创建Label
 *
 *  @param frame frame
 *  @param title 标题
 *  @param font  字体大小
 *
 *  @return Label
 */
+ (UILabel*)getLabel:(CGRect)frame title:(NSString *)title font:(CGFloat )font;
/**
 *  创建textField
 *
 *  @param fram        frame
 *  @param placeholder 默认文字
 *  @param num         对齐方式  1左 2中  3右
 *
 *  @return textField
 */
+ (UITextField *)getTextFiledFrame:(CGRect)fram placeholder:(NSString *)placeholder textAlignment:(NSInteger)num;

/**
 *  添加圆角边框
 */
+(void)addBorderOnView:(UIView *)view cornerRad:(CGFloat)cornerRad lineCollor:(UIColor *)collor lineWidth:(CGFloat)lineWidth;
/**
 *  不同颜色不同字体大小字符串
 */
+(NSMutableAttributedString *)getOtherColorString:(NSString *)string Color:(UIColor *)Color font:(CGFloat)font inStr:(NSString *)instr;
//设置状态栏颜色
+ (void)setStatusBarBackgroundColor:(UIColor *)color;

#pragma mark - 支付
-(void)wxPay:(NSDictionary *)dic andBlock:(payBlock)block;
#pragma mark - 多线程
/**
 主线程执行
 
 @param myQueue 任务
 */
+(void)GCDMainQueue:(MyQueue)myQueue;
/**
 *  异步  并行通信
 *
 *  @param myQueue 任务
 */
+ (void)GCDMoreQueueParallelProgressBlock:(MyQueue)myQueue;
/**
 *  异步 串行通信
 *
 *  @param myQueue 任务
 */
+ (void)GCDMoreQueueSeriesProgressBlock:(MyQueue)myQueue;

/**
 线程组

 @param done 完成后执行带模块
 @param queues 要做的任务
 */
+ (void)queueGroupdoneBlock:(MyQueue)done queue:(MyQueue)queues, ...NS_REQUIRES_NIL_TERMINATION;

#pragma mark -

#pragma mark - 字符串处理
// 计算高度
+ (CGSize)calStrSize:(NSString *)text andMaxSize:(CGSize)maxSize andFontSize:(CGFloat)fontSize;
// 时间转换
+ (NSString *)formateDate:(NSString *)dateString;
// 判断是不是空
+ (BOOL)isBlankString:(NSString *)string;
#pragma mark -

#pragma mark - 时间转换

/**
 获取当前时间

 @param timeType 输出类型
 @return 时间
 */
+ (NSString*)getCurrentTimeFormatter:(NSString *)timeType;

/**
 *  时间转换成时间戳
 *
 *  @param date 时间
 *
 *  @return 时间戳
 */
+ (NSString *)DateConvertTimeInterval:(NSDate *)date;

/**
 *  时间戳转换成时间
 *
 *  @param TimeInterval 时间戳
 *
 *  @type 1 日期 2  时间 3 时间加日期
 *  @return 时间
 */
/**
 *  时间戳转时间
 *
 *  @param TimeInterval 时间戳
 *  @param formatter    格式  1 日期  2 时间 3 日期 + 时间
 *
 *  @return 时间
 */
+ (NSString *)TimeIntervalConvertDate:(NSInteger )TimeInterval andFormatter:(NSInteger)formatter;
// 日期格式转字符串
+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format;
// 字符串转日期格式
+ (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format;
// 将世界时间转化为中国区时间
+ (NSDate *)worldTimeToChinaTime:(NSDate *)date;
#pragma mark -

#pragma mark - 清理缓存
/**
 *  计算缓存值
 *
 *  @param path 路径
 *
 *  @return 计算结果
 */
+(NSString*)folderSizeAtPath:(NSString *)path;
/**
 *  清理缓存
 *
 *  @param path 路径
 */
+(void)clearCache:(NSString *)path;
#pragma mark -

#pragma mark - MD5加密
//把字符串加密成32位小写md5字符串
+ (NSString*)md532BitLower:(NSString *)inPutText;

//把字符串加密成32位大写md5字符串
+ (NSString*)md532BitUpper:(NSString*)inPutText;

#pragma mark -
#pragma mark - 签名加密
/**
 * 获取32为随机字符串
 */
//+ (NSString *)getRandomString;
/**
 * 获取用户IP地址
 */
//+ (NSString *)deviceIPAdress;
/**
 * 签名，并返回添加签名的完整字典
 */
//+ (NSMutableDictionary *)partnerSignOrder:(NSDictionary*)paramDic;
/**
 * MD5 签名
 */
//+ (NSString *)signString:(NSString*)origString;
#pragma mark -
#pragma mark - 转码
+ (NSString *)stringByReplacingPercentEscapesUsingEncoding:(NSString *)str;
#pragma mark -

#pragma mark - 网络请求
/**
 *  获取当前网络类型
 *
 *  @return 网络类型
 */



+ ( NSString * ) getNetworkType;

/**
 *  post请求
 *
 *  @param url      除去固定部分 拼接的URL
 *  @param params   请求参数字典
 *  @param progress 请求进度回调代码块
 *  @param succress 请求成功回调代码块
 *  @param failure  请求失败回调代码块
 */
+(void)postWithURL:(NSString *)url parameters:(id)params progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;
/**
 *  图片上传
 *
 *  @param imgData  图片数据  Data
 *  @param fileName 服务器文件路径
 *  @param url      除去固定部分 拼接的URL
 *  @param params   请求参数字典
 *  @param progress 请求进度回调代码块
 *  @param succress 请求成功回调代码块
 *  @param failure  请求失败回调代码块
 */
+(void)upLoadImage:(NSData *)imgData fileName:(NSString *)fileName PostWithURL:(NSString *)url parameters:(id)params progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;
/**
 *  上传文件
 *
 *  @param fileData 图片组
 *  @param params   其他参数
 *  @param result   成功回调
 *  @param failure  失败回调
 */
+ (void)updateFile:(NSArray*)fileData url:(NSString*)url parameters:(NSMutableDictionary*)params fileName:(NSString*)fileName viewControler:(UIViewController*)vc success:(void(^)(id result))result failure:(FailureBlock)failure;
/**
 *  get  请求
 *
 *  @param url 请求链接
 *  @param params   其他参数
 *  @param result   成功回调
 *  @param failure  失败回调
 */
+(void)getWithURL:(NSString *)url parameters:(NSDictionary*)params success:(SuccessBlock)success failure:(FailureBlock)failure;



/**
 文件下载
 
 @param name 文件名
 @param url 下载地址
 @param isUser 是否使用url中的文件名
 @param success 成功
 @param failure 失败
 */
+(void)downLoadFilename:(NSString *)name anduserUrlname:(BOOL)isUser andToDocument:(NSString *)url downloadProgress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;


/**
 DELETE 请求

 *  @param url 请求链接
 *  @param params   其他参数
 *  @param result   成功回调
 *  @param failure  失败回调
 */
+(void)deleteWithURL:(NSString *)url parameters:(id)params progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;
/**
 PUT 请求
 
 *  @param url 请求链接
 *  @param params   其他参数
 *  @param result   成功回调
 *  @param failure  失败回调
 */
+(void)putWithURL:(NSString *)url parameters:(id)params progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;
#pragma mark -

#pragma mark - 数据存储

/**
 *  存储value
 */
+(void)saveInMyLocalStoreForValue:(id)value atKey:(NSString *)key;
/**
 *  获取value
 */
+(id)getValueInMyLocalStoreForKey:(NSString *)key;
/**
 *  删除value
 */
+(void)DeleteValueInMyLocalStoreForKey:(NSString *)key;
+ (NSString *)imageWritToFile:(UIImage *)img name:(NSString *)strName;
#pragma mark - 传值

/**
 发送一个通知

 @param name 名称
 @param obj  对象
 @param dic  数据
 */
+ (void)addNoticeName:(NSString *)name object:(id)obj userInfo:(NSDictionary *)dic;

#pragma mark -

#pragma mark - 数据类型转换
/**
 *  字典转JSON
 *
 *  @param dic 字典
 *
 *  @return JOSN数据串
 */
+(NSString *)getJsonDictionary:(NSDictionary *)dic;
/**
 *  数组转JSON
 *
 *  @param arr 数组
 *
 *  @return JOSN数据串
 */
+(NSString *)getJsonArray:(NSArray *)arr;
/*
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/*
 * @brief 把格式化的JSON格式的字符串转换成数组
 * @param jsonString JSON格式的字符串
 * @return 返回数组
 */

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString;

/*
 * @brief 把格式化的JSON格式的Data转换成字典
 * @param data JSON格式的数据
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithData:(NSData *)data;
/**
 *  将阿拉伯数字转换为中文数字
 */
+(NSString *)translationArabicNum:(NSInteger)arabicNum;
#pragma mark -

#pragma mark - 判断数据类型

/**
  判断是否包含表情

 @param string 字符串

 @return 结果
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
/**
 *  判断手机号码是否正确
 *
 *  @param phoneText 手机号
 *
 *  @return 判读结果
 */
+ (BOOL)isTelphoneNum:(NSString *)phoneText;
/**
 *  判断是否是整形数据
 *
 *  @param string 数据
 *
 *  @return 结果
 */
+ (BOOL)isPureInt:(NSString*)string;
/**
 *  判断是否包含中文
 *
 *  @param password 字符串
 *
 *  @return 结果
 */
+ (BOOL)isValidatePassword:(NSString *)password;

/**
 判断是否满足 6-18位数字或字母密码
 
 @param password 密码
 
 @return 结果
 */
+(BOOL)isPassword:(NSString *)password;

//判断邮箱格式是否正确的代码：
//利用正则表达式验证
+(BOOL)isValidateEmail:(NSString *)email;

/**
 身份证格式识别
 
 @param cardNo 身份证
 
 @return 结果
 */
+(BOOL)isIDCard:(NSString*)cardNo;

#pragma mark - 硬件设备相关

/**
 打电话

 @param num 电话号码
 */
+(void)callWithPhoneNum:(NSString *)num;
/**
 闪光灯操作
 
 @param state YES 开  NO关
 */
+(void)flashlightTorchMode:(BOOL)state;
#pragma mark - 权限判断
// 相册权限
- (void)isCanUsePhotosBlcok:(payBlock)block;

#pragma mark -

#pragma mark - 宏定义

#pragma mark - KEY

#define kURLMain @"http://xnm2.doudou360.com/api/"
// 错误日志输出地址 ，根据自己电脑配置
#define ErrorPath  @"/Users/aranion/Desktop/Report/error.html"

#pragma mark - 判断数据是否为空
//字符串是否为空
#define kIsEmptyString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kIsEmptyArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kIsEmptyDict(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kIsEmptyObject(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
#pragma mark -
#pragma mark - 常用
/**
 *  持久化 KEY 值
 */
#define kReachability @"myReachability"

/**
 *  当前网络状态
 */
#define kNetworkType [XXTollClass getValueInMyLocalStoreForKey:kReachability]
/**
 *  懒人简化书写宏
 */
#define kXXTollClass [XXTollClass Shared]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kNetWorkManager [NetWorkManager sharedInstance]
#define kWS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
/**
 *  请求提示文字
 */
#define kText_Loading @"请稍后..."
#define kText_Failure @"请求失败--------------------"
#define kText_Error @"错误-----"
#define kText_Success @"成功"
#define kText_NetworkPoor @"网络错误"
/**
 *  iPhone or iPad
 */
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//// 自定义输出在调测时
//#ifdef DEBUG
//#define XXLog(...) NSLog(@"-----------"__VA_ARGS__)
//#else
//#define XXLog(...)
//#endif

#define filePath3 [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

// 系统版本
#define kSystem_version [[[UIDevice currentDevice] systemVersion] floatValue]
// 软件版本
#define kApp_version [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"]

// 字符串转化
#define  kStrFromNum(num)  [NSString stringWithFormat:@"%@",@(num)]
#define  kNum_IntFromStr(str)  [str intValue]
#define  kNum_FloatFromStr(str)  [str floatValue]

#pragma mark - 对象 属性 控件

#define kp [NSTimer scheduledTimerWithTimeInterval:100 target:self selector:@selector(push) userInfo:nil repeats:YES]
#pragma mark -

@end
