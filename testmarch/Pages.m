//
//  Pages.m
//  testmarch
//
//  Created by Erik Leb on 2016-03-09.
//  Copyright © 2016 Erik Leb. All rights reserved.
//

#import "Pages.h"

@interface Pages ()

@end

@implementation Pages
{
    NSArray *myViewControllers;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.dataSource = self;
    
    UIViewController *p1 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"View1"];
    UIViewController *p2 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"View3"];
//    UIViewController *p3 = [self.storyboard
//                            instantiateViewControllerWithIdentifier:@"Intro3ID"];
//    UIViewController *p4 = [self.storyboard
//                            instantiateViewControllerWithIdentifier:@"Intro4ID"];
    
    myViewControllers = @[p1,p2];
    
    [self setViewControllers:@[p1]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO completion:nil];
    
    NSLog(@"loaded!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    return myViewControllers[index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
     viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [myViewControllers indexOfObject:viewController];
    // get the index of the current view controller on display
    
    if (currentIndex > 0)
    {
        return [myViewControllers objectAtIndex:currentIndex-1];
        // return the previous viewcontroller
    } else
    {
        return nil;
        // do nothing
    }
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [myViewControllers indexOfObject:viewController];
    // get the index of the current view controller on display
    // check if we are at the end and decide if we need to present
    // the next viewcontroller
    if (currentIndex < [myViewControllers count]-1)
    {
        return [myViewControllers objectAtIndex:currentIndex+1];
        // return the next view controller
    } else
    {
        return nil;
        // do nothing
    }
}
-(NSInteger)presentationCountForPageViewController:
(UIPageViewController *)pageViewController
{
    return myViewControllers.count;
}

-(NSInteger)presentationIndexForPageViewController:
(UIPageViewController *)pageViewController
{
    return 0;
}

@end