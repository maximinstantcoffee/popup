//
//  DialogAnimationController.h
//  Popup
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DialogAnimationController : NSObject<UIViewControllerAnimatedTransitioning>

@property BOOL forPresented;
- (id)init:(BOOL)forPresented;

@end

NS_ASSUME_NONNULL_END
