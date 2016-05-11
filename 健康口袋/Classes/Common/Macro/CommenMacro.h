//
//  CommenMacro.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

//判断是不是ios7设备
#define ios7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

//获取RGB颜色
#define ColorA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define NavigationBarColor [UIColor getColor:@"00CC99"]
// 自定义Log
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s %d %@",__func__, __LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

// 7.常用的对象
#define NotificationCenter [NSNotificationCenter defaultCenter]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取屏幕 宽度、高度
#define ScreenWeight ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenSize [UIScreen mainScreen].bounds.size

//弱引用self
#define WeakSelf __weak typeof(self)  weakSelf = self

//字体
#define Font(number) [UIFont systemFontOfSize:number]

//加载xib
#define xibView(xibName) [[[NSBundle mainBundle]loadNibNamed:xibName owner:nil options:nil] firstObject]

//加载plist数组
#define plistArray(plistName)  [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"]]

#define image(imageName) [UIImage imageNamed:imageName]

