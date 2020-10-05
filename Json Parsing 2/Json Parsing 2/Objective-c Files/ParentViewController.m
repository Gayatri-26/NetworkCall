

#import "ParentViewController.h"
#import "SecondVC.h"
#import "FirstVC.h"

@interface ParentViewController ()

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 400, 435)];
    scroll.contentSize = CGSizeMake(320, 700);
    scroll.showsHorizontalScrollIndicator = YES;

    NSArray *itemArray = [NSArray arrayWithObjects: @"FirstVC", @"SecondVC", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(75, 50, 250, 50);
    if (@available(iOS 13.0, *)) {
        segmentedControl.selectedSegmentTintColor = UIColor.blueColor;
    } else {
        NSLog(@"got some error");
        }
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
  //  segmentedControl.selectedSegmentIndex = 1;
    [scroll addSubview:segmentedControl];
    [self.view addSubview:scroll];

}

- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
    if(segment.selectedSegmentIndex == 0)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        FirstVC *fvc = [[FirstVC alloc] init];
        fvc = (FirstVC *)[storyboard instantiateViewControllerWithIdentifier:@"FirstVC"];
        [self displayFirstVC: fvc];
    }
    
    if(segment.selectedSegmentIndex == 1)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        SecondVC *svc = [[SecondVC alloc] init];
        svc = (SecondVC *)[storyboard instantiateViewControllerWithIdentifier:@"SecondVC"];
        [self displaySecondVC: svc];
    }
}

        - (void) displayFirstVC: (FirstVC *) content;
        {
            //add as childViewController
            [self addChildViewController:content];
            [content didMoveToParentViewController:self];
            [content.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
            [self.view addSubview:content.view];
        }

       - (void) displaySecondVC: (SecondVC *) content;
       {
           //add as childViewController
           [self addChildViewController:content];
           [content didMoveToParentViewController:self];
           [content.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
           [self.view addSubview:content.view];
       }


@end
