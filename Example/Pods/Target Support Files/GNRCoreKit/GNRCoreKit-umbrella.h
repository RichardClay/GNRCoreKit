#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "GNRAlertViewController.h"
#import "GNRTextView.h"
#import "GNRSwitch.h"
#import "GNRMacro.h"
#import "NSString+GNRExtension.h"
#import "UIApplication+GNRHelper.h"
#import "UIColor+GNRExtension.h"
#import "UIImage+GNRColor.h"
#import "UIScrollView+GNRSafeArea.h"
#import "UIView+GNRSafeArea.h"
#import "GNRCoreKitHeader.h"

FOUNDATION_EXPORT double GNRCoreKitVersionNumber;
FOUNDATION_EXPORT const unsigned char GNRCoreKitVersionString[];

