//
//  GNRTextView.h


#import <UIKit/UITextView.h>

/**
 UITextView with placeholder support
 */
@interface GNRTextView : UITextView

/**
 Set textView's placeholder text. Default is nil.
 */
@property(nonatomic,copy)   NSString *placeholder;

@end




