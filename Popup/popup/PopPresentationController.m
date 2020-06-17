//
//  FidoImagePresentationController.m
//  Popup
//
//

#import "PopPresentationController.h"

@interface PopPresentationController(){
}

@property (nonatomic) UIView *overlayView;

@end

@implementation PopPresentationController

- (void)presentationTransitionWillBegin
{
    [super presentationTransitionWillBegin];
    
    self.overlayView = [[UIView alloc]init];
    // 表示トランジション開始前の処理
    self.overlayView.frame = self.containerView.bounds;
    self.overlayView.backgroundColor = [UIColor blackColor];
    self.overlayView.alpha = 0.0;
    [self.containerView insertSubview:self.overlayView atIndex:0];
    
    id <UIViewControllerTransitionCoordinator> coordinator = [self.presentedViewController transitionCoordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.overlayView.alpha = 0.5;
    } completion:nil];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{

}

- (void)dismissalTransitionWillBegin
{
    [super dismissalTransitionWillBegin];
    // 非表示トランジション開始前の処理
    id <UIViewControllerTransitionCoordinator> coordinator = [self.presentedViewController transitionCoordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.overlayView.alpha = 0.0;
    } completion:nil];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    [super dismissalTransitionDidEnd:completed];
    
    // 非表示トランジション終了時の処理
    if (completed){
        [self.overlayView removeFromSuperview];
    }
}

- (CGRect)frameOfPresentedViewInContainerView
{
    return self.containerView.bounds;
}

- (void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
        
    // レイアウト開始前の処理
    self.overlayView.frame = self.containerView.bounds;
    self.presentedView.frame = self.frameOfPresentedViewInContainerView;
}


@end
