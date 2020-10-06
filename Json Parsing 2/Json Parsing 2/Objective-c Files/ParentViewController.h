

#import <UIKit/UIKit.h>
#import "SecondVC.h"
#import "FirstVC.h"


@interface ParentViewController : UIViewController

 - (void) displayFirstVC: (FirstVC *) content;
@property(nonatomic, strong) UIViewController *parentViewController;



@end

