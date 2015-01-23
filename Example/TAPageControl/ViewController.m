//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "ViewController.h"
// Views
#import "TAExampleDotView.h"
#import "TAPageControl.h"


static CGFloat const kNumberOfPages = 5;


@interface ViewController () <UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) TAPageControl *customPageControl;
@property (weak, nonatomic) IBOutlet TAPageControl *customStoryboardPageControl;
@property (strong, nonatomic) IBOutletCollection(UIScrollView) NSArray *scrollViews;

@property (weak, nonatomic) IBOutlet UIScrollView *defaultScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *customScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *storyboardCustomScrollView;
@property (weak, nonatomic) IBOutlet UIView *customPageControlWrapper;


@end

@implementation ViewController


#pragma mark - Lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIScrollView *scrollView in self.scrollViews) {
        scrollView.delegate = self;
    }
    
    // TO DO , add img for scrollviews
    
    // Apple default
    self.pageControl.numberOfPages = kNumberOfPages;
    
    // TAPageControl from storyboard
    self.customStoryboardPageControl.numberOfPages = kNumberOfPages;

    // Progammatically init a TAPageControl with a custom dot view.
    self.customPageControl               = [[TAPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.customScrollView.frame) - 40, CGRectGetWidth(self.customScrollView.frame), 40)];
    self.customPageControl.numberOfPages = kNumberOfPages;
    // Custom dot view
    self.customPageControl.dotViewClass  = [TAExampleDotView class];
    self.customPageControl.dotSize       = CGSizeMake(10, 10);

    [self.customPageControlWrapper addSubview:self.customPageControl];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    for (UIScrollView *scrollView in self.scrollViews) {
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame) * kNumberOfPages, CGRectGetHeight(scrollView.frame));
    }
}


#pragma mark - ScrollView delegate



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger pageIndex = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    
    if (scrollView == self.defaultScrollView) {
        self.pageControl.currentPage = pageIndex;
    } else if (scrollView == self.customScrollView) {
        self.customPageControl.currentPage = pageIndex;
    } else {
        self.customStoryboardPageControl.currentPage = pageIndex;
    }
}

@end
