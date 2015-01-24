About TAPageControl
===
<strong>TAPageControl</strong> basically is a more powerfull UIPageControl.
It offers you greater flexibility and customization.

![demo](https://dl.dropboxusercontent.com/u/20482310/TAPageControl.gif)


How it works
===

It works like a basic UIPageControl but with more options and properties so it can fit your needs.
It comes with a default dot view, but you can easily replace it by any <em>UIView</em> object that you want (more on that later) or with any <em>image</em>.

The only required property to set to get it working, like UIPageControl, is a number of pages :
```objc
self.pageControl.numberOfPages = 9;
```

Installation
===

#### CocoaPods

With CocoaPods by adding in your podfile the following line :

```ruby
pod 'TAPageControl'
```

#### Manually

It's quite easy, just download the archive and add the <code>TAPageControl</code> folder to your own project.
Don't forget to import the header file wherever you need it :

``` objective-c
#import "TAPageControl.h"
```

Customization's magic
===

If you are looking for a page control I guess it's because the default one provided by Apple did not answer your need. Then you are looking for a page control that you can customize at will and you are at the right place!

<strong>TAPageControl</strong> uses two kind of source to display "dots" representing pages :
<ul>
<li>UIImage</li>
<li>UIView</li>
</ul>

<em>UIImage</em> is the simplest way to make your page control look the way you want. There are two properties :
``` objective-c
/**
 *  UIImage to represent a dot.
 */
@property (nonatomic) UIImage *dotImage;

/**
 *  UIImage to represent current page dot.
 */
@property (nonatomic) UIImage *currentDotImage;
```

By setting both properties with your images, the control will take care of displaying the correct version depending on the current page.


But what if you need more control? Well, will a <em>UIView</em> be enough for you?
By using :
``` objective-c
/**
 *  The Class of your custom UIView, make sure to respect the TAAbstractDotView class.
 */
@property (nonatomic) Class dotViewClass;
```
The control will instantiate your UIView class as a dot. 
I recommend subclassing your view with <code>TAAbstractDotView</code> because the only important thing to respect is the method to switch your view between active/inactive state.
``` objective-c
@interface TAAbstractDotView : UIView

/**
 *  A method call let view know which state appearance it should take. Active meaning it's current page. Inactive not the current page.
 *
 *  @param active BOOL to tell if view is active or not
 */
- (void)changeActivityState:(BOOL)active;
```
There you go, you can do whatever you want with it. Shape, color, animations... everything.


Take a look at the sample project to see how great and simple it is by yourself ;)


License
===

TAPageControl is available under the MIT license. See the LICENSE file for more info.

More
===

Contribute to this repository as much as you like, and any advice are welcome! =). I hope you will enjoy it.
