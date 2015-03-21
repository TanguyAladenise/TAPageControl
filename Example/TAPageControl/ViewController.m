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



@interface ViewController () <UIScrollViewDelegate, TAPageControlDelegate>

@property (weak, nonatomic) IBOutlet TAPageControl *customStoryboardPageControl;
@property (strong, nonatomic) TAPageControl *customPageControl2;
@property (strong, nonatomic) TAPageControl *customPageControl3;

@property (strong, nonatomic) IBOutletCollection(UIScrollView) NSArray *scrollViews;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView2;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView3;

@property (weak, nonatomic) IBOutlet UIView *wrapper2;
@property (weak, nonatomic) IBOutlet UIView *wrapper3;

@property (strong, nonatomic) NSArray *imagesData;


@end


@implementation ViewController


#pragma mark - Lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imagesData = @[@"image1.jpg", @"image2.jpg", @"image3.jpg", @"image4.jpg", @"image5.jpg", @"image6.jpg"];

    [self setupScrollViewImages];
    
    for (UIScrollView *scrollView in self.scrollViews) {
        scrollView.delegate = self;
    }
    
    // TAPageControl from storyboard
    self.customStoryboardPageControl.numberOfPages = self.imagesData.count;
    
    
    // Progammatically init a TAPageControl with a custom dot view.
    self.customPageControl2               = [[TAPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView2.frame) - 40, CGRectGetWidth(self.scrollView2.frame), 40)];
    // Example for touch bullet event
    self.customPageControl2.delegate      = self;
    self.customPageControl2.numberOfPages = self.imagesData.count;
    // Custom dot view
    self.customPageControl2.dotViewClass  = [TAExampleDotView class];
    self.customPageControl2.dotSize       = CGSizeMake(12, 12);

    [self.wrapper2 addSubview:self.customPageControl2];
    
    
    self.customPageControl3                 = [[TAPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView3.frame) - 40, CGRectGetWidth(self.scrollView3.frame), 40)];
    self.customPageControl3.numberOfPages   = self.imagesData.count;
    // Custom dot view with image
    self.customPageControl3.dotImage        = [UIImage imageNamed:@"dotInactive"];
    self.customPageControl3.currentDotImage = [UIImage imageNamed:@"dotActive"];
    
    [self.wrapper3 addSubview:self.customPageControl3];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    for (UIScrollView *scrollView in self.scrollViews) {
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame) * self.imagesData.count, CGRectGetHeight(scrollView.frame));
    }
}


#pragma mark - ScrollView delegate



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger pageIndex = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    
    if (scrollView == self.scrollView3) {
        self.customPageControl3.currentPage = pageIndex;
    } else if (scrollView == self.scrollView2) {
        self.customPageControl2.currentPage = pageIndex;
    } else {
        self.customStoryboardPageControl.currentPage = pageIndex;
    }
}


// Example of use of delegate for second scroll view to respond to bullet touch event
- (void)TAPageControl:(TAPageControl *)pageControl didSelectPageAtIndex:(NSInteger)index
{
    NSLog(@"Bullet index %ld", (long)index);
    [self.scrollView2 scrollRectToVisible:CGRectMake(CGRectGetWidth(self.scrollView2.frame) * index, 0, CGRectGetWidth(self.scrollView2.frame), CGRectGetHeight(self.scrollView2.frame)) animated:YES];
}


#pragma mark - Utils


- (void)setupScrollViewImages
{
    for (UIScrollView *scrollView in self.scrollViews) {
        [self.imagesData enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL *stop) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(scrollView.frame) * idx, 0, CGRectGetWidth(scrollView.frame), CGRectGetHeight(scrollView.frame))];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.image = [UIImage imageNamed:imageName];
            [scrollView addSubview:imageView];
        }];
    }
}

@end
