#import <UIKit/UIKit.h>

@interface UIView (Visibility)

#pragma mark -

- (void)show:(BOOL)animated
	duration:(NSTimeInterval)duration
	   delay:(NSTimeInterval)delay
	 options:(UIViewAnimationOptions)options
  animations:(void (^)(void))animations
  completion:(void (^)(void))completionHandler;

- (void)show;

- (void)fadeInWithDuration:(NSTimeInterval)duration
					 delay:(NSTimeInterval)delay
				   options:(UIViewAnimationOptions)options
				completion:(void (^)(void))completionHandler;
- (void)fadeInWithDuration:(NSTimeInterval)duration
				completion:(void (^)(void))completionHandler;
- (void)fadeInWithDuration:(NSTimeInterval)duration;
- (void)fadeIn:(void (^)(void))completionHandler;
- (void)fadeIn;

- (void)explodeWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler;
- (void)explodeWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler;
- (void)explodeWithDuration:(NSTimeInterval)duration;
- (void)explode:(void (^)(void))completionHandler;
- (void)explode;

#pragma mark -

- (void)hide:(BOOL)animated
	duration:(NSTimeInterval)duration
	   delay:(NSTimeInterval)delay
	 options:(UIViewAnimationOptions)options
  animations:(void (^)(void))animations
  completion:(void (^)(void))completionHandler;

- (void)hide;

- (void)fadeOutWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler;
- (void)fadeOutWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler;
- (void)fadeOutWithDuration:(NSTimeInterval)duration;
- (void)fadeOut:(void (^)(void))completionHandler;
- (void)fadeOut;

- (void)implodeWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler;
- (void)implodeWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler;
- (void)implodeWithDuration:(NSTimeInterval)duration;
- (void)implode:(void (^)(void))completionHandler;
- (void)implode;

#pragma mark -

- (void)slideUpWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler;
- (void)slideUpWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler;
- (void)slideUpWithDuration:(NSTimeInterval)duration;
- (void)slideUp:(void (^)(void))completionHandler;
- (void)slideUp;

- (void)slideDownWithDuration:(NSTimeInterval)duration
						delay:(NSTimeInterval)delay
					  options:(UIViewAnimationOptions)options
				   completion:(void (^)(void))completionHandler;
- (void)slideDownWithDuration:(NSTimeInterval)duration
				   completion:(void (^)(void))completionHandler;
- (void)slideDownWithDuration:(NSTimeInterval)duration;
- (void)slideDown:(void (^)(void))completionHandler;
- (void)slideDown;

@end