//
//  ViewController.m
//  Popup
//
//

#import "ViewController.h"
#import "SamplePopUpViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SamplePopUp" bundle:nil];
    SamplePopUpViewController *viewcontroller = [storyboard instantiateViewControllerWithIdentifier:@"SamplePopUp"];
    [self presentViewController:viewcontroller animated:YES completion:nil];
}


@end
