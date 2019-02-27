//
//  XXMacro.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/15.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#ifndef XXMacro_h
#define XXMacro_h

#import <UIKit/UIKit.h>

#define kHDShow [MBProgressHUD showProgress:kWindow]
#define kHDHide [MBProgressHUD hideHUDForView:kWindow]

// 国际化语言
#define kLocLanguage(str) NSLocalizedString(str, nil)


#pragma mark - 判空
// ========判空============
// 字符串
#define kIsEmptyStr(str)  ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 || [str isEqualToString:@"<null>"] || [str isEqualToString:@"(null)"] ? YES : NO )
// 判断空并且替换
#define kIsEmptyStrReplac(str1,str2)  ([str1 isKindOfClass:[NSNull class]] || str1 == nil || [str1 length] < 1 || [str1 isEqualToString:@"<null>"] || [str1 isEqualToString:@"(null)"]? str2 : str1)

// 数组
#define kIsEmptyArr(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
// 字典
#define kIsEmptyDic(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || dic.count == 0)
// 对象
#define kIsEmptyObj(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#pragma mark - 缩写
// =========缩写==============

// 获取Window
#define kWindow [UIApplication sharedApplication].keyWindow
// AppDelegate对象
#define kAppDelegate [[UIApplication sharedApplication] delegate]
// Application
#define kApplication        [UIApplication sharedApplication]
// UserDefaults
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
// NotificationCenter
#define kNotificationCenter [NSNotificationCenter defaultCenter]
// 获取图片资源
#define kImage(imgName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imgName]]
// 打开网络地址
#define kOpenUrl(url) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
// IndexPath
#define kIndexPath(x,y) [NSIndexPath indexPathForRow:(y) inSection:(x)]
// IndexSet
#define kIndexSet(x) [NSIndexSet indexSetWithIndex:(x)]
// 取阿里云压缩图片
#define kOssImg(url,w) [NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_%d",url,w]
// 可变数组
#define kMarr(arr) [NSMutableArray arrayWithArray:arr]
// 可变字典
#define kMdic(dic)  [NSMutableDictionary dictionaryWithDictionary:dic]

#pragma mark - 尺寸
// =========尺寸==============
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断是否是iPhoneX系列
#define   KIsiPhoneX   ((int)((kScreen_H/kScreen_W)*100) == 216) ? YES:((int)((kScreen_H/kScreen_W)*100) == 46) ? YES:NO
// 屏幕宽
#define kScreen_W [UIScreen mainScreen].bounds.size.width
// 屏幕高
#define kScreen_H [UIScreen mainScreen].bounds.size.height

// 导航栏高
#define kNav_H (((int)((kScreen_H/kScreen_W)*100) == 216) ? 88:64)
// 导航栏高
#define kStatus_H (((int)((kScreen_H/kScreen_W)*100) == 216)? 44 : 20)
// 底部安全高度
#define kSafeAreaBottomHeight (((int)((kScreen_H/kScreen_W)*100) == 216)? 24 : 0)

// 标签栏高
#define kTab_H 49

// frame
#define kFrame(x,y,w,h)         CGRectMake((x), (y), (w), (h))
// UIEdgeInsets
#define kEdgeInsets(top,left,bottom,right) UIEdgeInsetsMake((top),(left),(left),(right))

// UI设计稿的 宽 高
#define kUI_W 375.0
#define kUI_H 667.0

// 适配比例 iPhone6 为标准  等比例缩放宽高位置 4（320*480） 5（320*568）6（375*667）6+（414*736）
#define kScale_W(w) ((w)*kScreen_W/kUI_W)
#define kScale_H(h) ((h)*kScreen_H/kUI_H)
#define kScale_Frame(x,y,w,h)  CGRectMake(((x)*kScreen_W/kUI_W), ((y)*kScreen_H/kUI_H), ((w)*kScreen_W/kUI_W), ((h)*kScreen_H/kUI_H))
// 适配字体大小
#define kScale_Font(x) [UIFont systemFontOfSize:(x*kScreen_W/kUI_W)]
// 适配值
#define kScale_Num(x) (x*kScreen_W/kUI_W)

// 创建点Point
#define  kPoint(x,y)             CGPointMake((x), (y))
// 创建尺寸size
#define  kSize(w,h)              CGSizeMake((w), (h))
// 字体大小
#define kFont(x) [UIFont systemFontOfSize:x]
// 由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
// 由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

#pragma mark - 提示文字

/**
 *  请求提示文字
 */
#define kTxt_Loading @"请稍后..."
#define kTxt_Failure @"请求失败--------------------"
#define kTxt_Error @"错误-----"
#define kTxt_Success @"成功"
#define kTxt_NetworkPoor @"网络错误"

/**
 *  iPhone or iPad
 */
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//// 自定义输出在调测时
//#ifdef DEBUG
//#define XXLog(fmt, ...) NSLog((@"\n*******************************\n%s [Line %d]\n " \
//fmt \
//@"\n"), \
//__PRETTY_FUNCTION__,__LINE__, ##__VA_ARGS__);
//#else
//#define XXLog(...) while(0)
//#endif
//
//#endif

#pragma mark - 系统信息

// ======系统信息=============
// App Store 地址(替换APPID)
#define kAppDLUrl @"itms-apps://itunes.apple.com/app/id1157454646"
// App版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 系统版本
#define kSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
// 获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
// 获取temp
#define kPathTemp NSTemporaryDirectory()
// 获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
// 获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//获取AppDelegate
#define appDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//用于控制是否输出调试信息
#ifdef DEBUG
#define XXLog(format, ...)  NSLog(format, ## __VA_ARGS__) // printf("--------------\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define XXLog(format, ...)
#endif

#pragma mark - 颜色

// RGB颜色设置
#define kRGB(r,g,b)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
// RGB 透明度 颜色设置
#define kRGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]
// 默认白色
#define kColor_White [UIColor whiteColor]
// 随机色
#define kColor_Random [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
// 默认黑色 0.3半透明// 默认黑色 0.3半透明
#define kColor_Black_03 kRGBA(0,0,0,0.3)


// 主题颜色
#define kColor_Main [UIColor colorWithRed:56/255.0 green:55/255.0 blue:60/255.0 alpha:1.0]
// 主题辅助颜色（状态，提示等...)
#define kColor_Assist [UIColor colorWithRed:248/255.0 green:214/255.0 blue:81/255.0 alpha:1.0]
// 主要字体颜色
#define kColor_Font [UIColor blackColor]

// ----- App颜色
//主题红色
//#define kThemeColor [UIColor colorWithRed:216.0/255.0 green:22.0/255.0 blue:23.0/255.0 alpha:1]
//主题红色B
#define kThemeColor_B [UIColor colorWithRed:255.0/255.0 green:138.0/255.0 blue:0.0/255.0 alpha:1]
//深灰色
#define kFontDarkColor [UIColor darkGrayColor]
//背景颜色
//#define kBGColor [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1]
//204灰色
#define kGray204 [UIColor colorWithRed:255.0/255.0 green:138.0/255.0 blue:0.0/255.0 alpha:1]

#define kColor_Line kColorFromHex(0Xdbdfe8)
// 常用颜色
#define kColor_333  kColorFromHex(0x333333)
#define kColor_666  kColorFromHex(0x666666)
#define kColor_999  kColorFromHex(0x999999)
#define kColor_ddd  kColorFromHex(0xdddddd)

#define kColor_f5  kColorFromHex(0xf5f5f5)
#define kColor_f6  kColorFromHex(0xf6f6f6)
#define kColor_f8  kColorFromHex(0xf8f8f8)
#define kColor_f9  kColorFromHex(0xf9f9f9)
#define kColor_fff  kColorFromHex(0xffffff)
#pragma mark - 线程

// =========线程==============
//在Main线程上运行
#define kMain_Thread(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//主线程上Demo
//kMain_Thread(^{
//更新UI
//})

//在Global Queue上运行
#define DISPATCH_ON_GLOBAL_QUEUE_HIGH(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_LOW(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_BACKGROUND(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), globalQueueBlocl);

//Global Queue
//DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(^{
//异步耗时任务
//})

//弱引用/强引用  可配对引用在外面用MPWeakSelf(self)，block用MPStrongSelf(self)  也可以单独引用在外面用MPWeakSelf(self) block里面用weakself
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define MkStrongSelf(type)  __strong typeof(type) type = weak##type;

#pragma mark - 数据

#define kIntValue(str) [kIsEmptyStrReplac(str,@"0")  intValue]
#define kFloatValue(str) [kIsEmptyStrReplac(str,@"0.0") floatValue]
#define kString(str)  [NSString stringWithFormat:@"%@",str]
#define kStrNum(num)  [NSString stringWithFormat:@"%@",@(num)]
#define kStrUrl(str) [NSString stringWithFormat:@"http://%@",str]
#define kStrMerge(str1,str2)  [NSString stringWithFormat:@"%@%@",str1,str2]
#define kStrEqual(str1,str2) [[NSString stringWithFormat:@"%@",str1] isEqualToString:[NSString stringWithFormat:@"%@",str2]]
#define kUrl(str1)  [NSURL URLWithString:[NSString stringWithFormat:@"%@",str1]]
#define kRequest(str1) [NSURLRequest requestWithURL:[NSURL URLWithString:str1]]

static NSString * const KEY_USERNAME_PASSWORD = @"com.zhouse.app.usernamepassword";
static NSString * const KEY_USERNAME = @"com.zhouse.app.username";
static NSString * const KEY_PASSWORD = @"com.zhouse.app.password";

typedef void(^XXObjBlock)(id obj);
typedef void(^XXDictionaryBlock)(NSDictionary *dic);
typedef void(^XXNSArrayBlock)(NSArray *arr);
typedef void(^XXBOOLBlock)(BOOL isTrue);
typedef void(^XXIntegerBlock)(NSInteger num);
typedef void(^XXFloatBlock)(CGFloat num);
typedef void(^XXVoidBlock)();

#endif /* XXMacro_h */

/*
 常用代码块
 
 // 弱引用
 __block typeof(self)weakSelf = self;
 
 // 属性声明
 @property (weak, nonatomic) <#UIView#>  *<#name#>;
 @property (strong, nonatomic) <#NSMutableArray#> *<#arr#>;
 @property (copy, nonatomic) NSString *<#str#>;
 @property (assign, nonatomic) <#NSInteger#> <#num#>;
 
 // 书签
 #pragma mark - <#描述#>
 
 // get方法
 - (<#NSArray#> *)<#arr#>
 {
 if (<#_arr#> == nil)
 {
 <#_arr#> = [<#NSArray#> new];
 }
 return  <#_arr#>;
 }
 
 // 代码块拷贝
 if (block)
 {
 self.block = [block copy];
 }
 
 // 代码块声明
 typedef void(^<#name#>Block)(<#NSInteger#> <#num#>);

 // 提示框
 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"sss" message:@"qqq" delegate:self cancelButtonTitle:@"1" otherButtonTitles:@"2",@"3", nil];
 alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
 [alertView show];
 
 // tableView相关
 #pragma mark - UITableViewDelegate
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 
 }
 #pragma mark -
 #pragma mark - tableViewDataSource
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 
 return cell;
 }
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
 return 10;
 }
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 return 1;
 }
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return 10;
 }
 #pragma mark -
 #pragma mark - Get
 - (UITableView*)tableView
 {
 if (_tableView == nil)
 {
 _tableView = [[UITableView alloc] initWithFrame:kFrame(0, 50, kScreen_W, kScreen_H-64) style:UITableViewStylePlain];
 _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
 _tableView.delegate = self;
 _tableView.dataSource = self;
 [self.view addSubview:_tableView];
 }
 return _tableView;
 }
 #pragma mark -
 
 
 // collectionView相关
 #pragma mark - collectionDelegate
 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
 {
 self.block(indexPath.item + 40);
 }
 #pragma mark - collectionDataScource
 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
 XXHomeBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCollection_cell" forIndexPath:indexPath];
 [cell setCell:(long)indexPath.row];
 
 return cell;
 }
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 return CGSizeMake(kScale_W(168), kScale_H(77));
 }
 //定义每个UICollectionView 的间距
 -(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
 return UIEdgeInsetsMake(0, 13, 0,13);
 }
 //section 的个数
 - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
 {
 return 1;
 }
 - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
 {
 return 3;
 }
 - (UICollectionView *)collection
 {
 if (_collection == nil)
 {
 UICollectionViewFlowLayout *layout = [[XXHorizontalFlowLayout  alloc] init];
 
 _collection = [[UICollectionView alloc] initWithFrame:kScale_Frame(0, 0, 320, 100) collectionViewLayout:layout];
 _collection.backgroundColor = kColor_White;
 _collection.minimumZoomScale = 14;
 _collection.showsVerticalScrollIndicator = NO;
 _collection.showsHorizontalScrollIndicator = NO;
 
 _collection.delegate = self;
 _collection.dataSource = self;
 
 UINib *nib = [UINib nibWithNibName:@"XXHomeBottomCollectionViewCell" bundle:nil];
 [_collection registerNib:nib forCellWithReuseIdentifier:@"homeCollection_cell"];
 
 [self addSubview:_collection];
 }
 return _collection;
 }
 
 
 
 */


