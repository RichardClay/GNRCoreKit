//
//  GNRMacro.h
//  Pods
//
//  Created by LvYuan on 2017/9/15.
//
//

#ifndef GNRMacro_h
#define GNRMacro_h

//MARK: - UI
#define GNR_SCREENBOUNDS [UIScreen mainScreen].bounds
#define GNR_SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define GNR_SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

//MARK: - Device
#define GNR_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//MARK: - SystemVersion
#define GNR_DEVICE_IOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0))
#define GNR_DEVICE_IOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0))
#define GNR_DEVICE_IOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0))
#define GNR_DEVICE_IOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 10.0))
#define GNR_DEVICE_IOS10 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 11.0))
#define GNR_DEVICE_IOS11 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 12.0))

//MARK: - Property
#define __PROPERTY_NO_COPY__(type,object) @property(nonatomic,copy)type object
#define __PROPERTY_AT_COPY__(type,object) @property(atomic,copy)type object
#define __PROPERTY_NO_STRONG__(type,object) @property(nonatomic,strong)type object
#define __PROPERTY_AT_STRONG__(type,object) @property(nonatomic,strong)type object

#define __PROPERTY_NO_ASSIGN__(type,object) @property(nonatomic,assign)type object
#define __PROPERTY_AT_ASSIGN__(type,object) @property(atomic,assign)type object
#define __PROPERTY_NO_WEAK__(type,object) @property(nonatomic,weak)type object
#define __PROPERTY_AT_WEAK__(type,object) @property(nonatomic,weak)type object

#define __PROPERTY_NO_STRONG__READLY__(type,object) @property(nonatomic,strong,readonly)type object
#define __PROPERTY_NO_ASSIGN__READLY__(type,object) @property(nonatomic,assign,readonly)type object
#define __PROPERTY_NO_WEAK__READLY__(type,object) @property(nonatomic,weak,readonly)type object

//MARK: - Log
#ifdef DEBUG
#define GNRAlertLog(fmt, ...) NSLog((@"========== GNRAlertView ==========\n========== Function%s  Line-%d\n========== " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define GNRAlertLog(fmt, ...)
#endif

//MARK: - Other
#define GNRWEAK_SELF __weak typeof(self) wself = self
#define __BLOCK__WEAK__SELF__(sel) __weak id sel =  self
#define __GET_APPDELEGGATE__(del) id del = [UIApplication sharedApplication].delegate;


#endif /* GNRMacro_h */
