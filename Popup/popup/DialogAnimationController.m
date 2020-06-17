//
//  DialogAnimationController.m
//  Popup
//
//

#import "DialogAnimationController.h"

@interface DialogAnimationController()

@end

@implementation DialogAnimationController

- (id)init:(BOOL)forPresented
{
    self.forPresented = forPresented;

    return self;
}

// アニメーション時間
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.2;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.forPresented) {
        [self presentAnimateTransition:transitionContext];
    } else {
        [self dismissAnimateTransition:transitionContext];
    }
}

// 表示時に使用するアニメーション
- (void)presentAnimateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *viewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:viewController.view];
    viewController.view.alpha = 0.0;
    viewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        viewController.view.alpha = 1.0;
        viewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

// 非表示時に使用するアニメーション
- (void)dismissAnimateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *viewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        viewController.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
