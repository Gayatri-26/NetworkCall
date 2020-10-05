

#import "ParentViewController.h"

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
    segmentedControl.frame = CGRectMake(35, 50, 250, 50);
    if (@available(iOS 13.0, *)) {
        segmentedControl.selectedSegmentTintColor = UIColor.blueColor;
    } else {
        NSLog(@"got some error");
        }
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 1;
    [scroll addSubview:segmentedControl];
    [self.view addSubview:scroll];

}

- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
    if(segment.selectedSegmentIndex == 0)
    {
        // code for the first button
    }
}

@end
