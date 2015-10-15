//
//  TAPageControl.h
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TAPageControlDelegate;

@interface TAPageControl : UIControl


/**
 * Dot view customization properties
 */

/**
 *  The Class of your custom UIView, make sure to respect the TAAbstractDotView class.
 */
@property (nonatomic) Class dotViewClass;


/**
 *  UIImage to represent a dot.
 */
@property (nonatomic) UIImage *dotImage;


/**
 *  UIImage to represent current page dot.
 */
@property (nonatomic) UIImage *currentDotImage;


/**
 *  Dot size for dot views. Default is 8 by 8.
 */

@property (nonatomic) IBInspectable CGSize dotSize;


/**
 *  Spacing between two dot views. Default is 8.
 */

@property (nonatomic) IBInspectable NSInteger spacingBetweenDots;


/**
 * Page control setup properties
 */


/**
 * Delegate for TAPageControl
 */
@property(nonatomic,assign) id<TAPageControlDelegate> delegate;


/**
 *  Number of pages for control. Default is 0.
 */
@property (nonatomic) IBInspectable NSInteger numberOfPages;


/**
 *  Current page on which control is active. Default is 0.
 */
@property (nonatomic) IBInspectable NSInteger currentPage;


/**
 *  Hide the control if there is only one page. Default is NO.
 */
@property (nonatomic) IBInspectable BOOL hidesForSinglePage;


/**
 *  Let the control know if should grow bigger by keeping center, or just get longer (right side expanding). By default YES.
 */
@property (nonatomic) IBInspectable BOOL shouldResizeFromCenter;


/**
 *  Return the minimum size required to display control properly for the given page count.
 *
 *  @param pageCount Number of dots that will require display
 *
 *  @return The CGSize being the minimum size required.
 */
- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;


@end


@protocol TAPageControlDelegate <NSObject>

@optional
- (void)taPageControl:(TAPageControl *)pageControl didSelectPageAtIndex:(NSInteger)index;

@end
