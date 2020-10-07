

#import "ParentViewController.h"
#import "SecondVC.h"
#import "FirstVC.h"

@interface ParentViewController ()

@property (weak, nonatomic) UIView *pview;
@property (weak, nonatomic) UIViewController *currentViewController;;

@end

@implementation ParentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
// self.currentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ComponentA"];
//    self.currentViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addChildViewController:self.currentViewController];
//    [self addSubview:self.currentViewController.view toView:self.containerView];
        UIView *view = [[UIView alloc]init];
    
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]init];
          [segmentedControl insertSegmentWithTitle:@"FirstVC" atIndex:0 animated:NO];
          [segmentedControl insertSegmentWithTitle:@"SecondVC" atIndex:1 animated:NO];
    
        segmentedControl.frame = CGRectMake(75, 50, 250, 50);
            if (@available(iOS 13.0, *)) {
                segmentedControl.selectedSegmentTintColor = UIColor.greenColor;
            } else {
                NSLog(@"got some error");
                }
           [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents: UIControlEventValueChanged];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    FirstVC *fvc = (FirstVC *)[storyboard instantiateViewControllerWithIdentifier:@"FirstVC"];
    SecondVC  *svc = (SecondVC *)[storyboard instantiateViewControllerWithIdentifier:@"SecondVC"];
    [self addChildViewController: fvc];
    [self addChildViewController: svc];
    [self.view addSubview:segmentedControl];

}

- (void)segmentAction:(UISegmentedControl *)segment
{
    if(segment.selectedSegmentIndex == 0)
    {
        
    }
    else if(segment.selectedSegmentIndex == 1){
        
        
    }
}




@end
