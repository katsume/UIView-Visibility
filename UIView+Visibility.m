#import "UIView+Visibility.h"

static NSTimeInterval const kFadeDuration		= 0.3;
static NSTimeInterval const kExplodeDuration	= 0.35;
static NSTimeInterval const kImplodeDuration	= 0.3;

@implementation UIView (Visibility)

#pragma mark -

- (void)show:(BOOL)animated
	duration:(NSTimeInterval)duration
	   delay:(NSTimeInterval)delay
	 options:(UIViewAnimationOptions)options
  animations:(void (^)(void))animations
  completion:(void (^)(void))completionHandler {
	
	if(self.hidden){
		
		self.hidden= NO;
		
		if(animated){
			
			[UIView animateWithDuration:duration
								  delay:delay
								options:options
							 animations:animations
							 completion:^(BOOL finished){
								 completionHandler();
							 }
			 ];
			
		} else {
			
			animations();
		}
	}
}

- (void)show {
	
	[self show:NO duration:0 delay:0 options:0 animations:^{} completion:^{}];
}

- (void)fadeInWithDuration:(NSTimeInterval)duration
					 delay:(NSTimeInterval)delay
				   options:(UIViewAnimationOptions)options
				completion:(void (^)(void))completionHandler {
	
	self.alpha= 0;
	
	[self show:YES
	  duration:duration
		 delay:delay
	   options:options
	animations:^{
		self.alpha= 1;
	}
	completion:completionHandler];
	
}

- (void)fadeInWithDuration:(NSTimeInterval)duration
				completion:(void (^)(void))completionHandler {
	
	[self fadeInWithDuration:duration
					   delay:0
					 options:0
				  completion:completionHandler];
	
}

- (void)fadeInWithDuration:(NSTimeInterval)duration {
	
	[self fadeInWithDuration:duration
					   delay:0
					 options:0
				  completion:^{}];
}

- (void)fadeIn:(void (^)(void))completionHandler {
	
	[self fadeInWithDuration:kFadeDuration
					   delay:0
					 options:0
				  completion:completionHandler];
}

- (void)fadeIn {
	
	[self fadeInWithDuration:kFadeDuration
					   delay:0
					 options:0
				  completion:^{}];
}

- (void)explodeWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler {
	
	self.transform= CGAffineTransformMakeScale(0.01f, 0.01f);
	[self show];
	[UIView animateWithDuration:duration*(0.15/kExplodeDuration) delay:delay options:UIViewAnimationOptionCurveEaseIn
					 animations:^{
						 self.transform= CGAffineTransformMakeScale(1.5f, 1.5f);
					 }
					 completion:^(BOOL finished){
						 [UIView animateWithDuration:duration*(0.1/kExplodeDuration) delay:0.0f options:UIViewAnimationOptionCurveEaseInOut
										  animations:^{
											  self.transform= CGAffineTransformMakeScale(0.8f, 0.8f);
										  }
										  completion:^(BOOL finished){
											  [UIView animateWithDuration:duration*(0.1/kExplodeDuration) delay:0.0f options:UIViewAnimationOptionCurveEaseOut
															   animations:^{
																   self.transform= CGAffineTransformIdentity;
															   }
															   completion:^(BOOL finished){
																   self.userInteractionEnabled= YES;
																   completionHandler();
															   }
											   ];
										  }
						  ];
					 }
	 ];
}

- (void)explodeWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler {
	
	[self explodeWithDuration:duration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)explodeWithDuration:(NSTimeInterval)duration {
	
	[self explodeWithDuration:duration
						delay:0
					  options:0
				   completion:^{}];
}

- (void)explode:(void (^)(void))completionHandler {
	
	[self explodeWithDuration:kExplodeDuration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)explode {
	
	[self explodeWithDuration:kExplodeDuration
						delay:0
					  options:0
				   completion:^{}];
	
}

#pragma mark -

- (void)hide:(BOOL)animated
	duration:(NSTimeInterval)duration
	   delay:(NSTimeInterval)delay
	 options:(UIViewAnimationOptions)options
  animations:(void (^)(void))animations
  completion:(void (^)(void))completionHandler {
	
	if(!self.hidden){
		
		if(animated){
			
			[UIView animateWithDuration:duration
								  delay:delay
								options:options
							 animations:animations
							 completion:^(BOOL finished){
								 self.hidden= YES;
								 completionHandler();
							 }
			 ];
			
		} else {
			
			animations();
			self.hidden= YES;
		}
	}
}

- (void)hide {
	
	[self hide:NO duration:0 delay:0 options:0 animations:^{} completion:^{}];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler {
	
	[self hide:YES
	  duration:duration
		 delay:delay
	   options:options
	animations:^{
		self.alpha= 0;
	}
	completion:completionHandler];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler {
	
	[self fadeOutWithDuration:duration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration {
	
	[self fadeOutWithDuration:duration
						delay:0
					  options:0
				   completion:^{}];
}

- (void)fadeOut:(void (^)(void))completionHandler {
	
	[self fadeOutWithDuration:kFadeDuration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)fadeOut {
	
	[self fadeOutWithDuration:kFadeDuration
						delay:0
					  options:0
				   completion:^{}];
}

- (void)implodeWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler {
	
	self.userInteractionEnabled= NO;
	
	[UIView animateWithDuration:duration*(0.1/kImplodeDuration) delay:delay options:UIViewAnimationOptionCurveEaseIn
					 animations:^{
						 self.transform= CGAffineTransformMakeScale(0.8f, 0.8f);
					 }
					 completion:^(BOOL finished){
						 [UIView animateWithDuration:duration*(0.1/kImplodeDuration) delay:0.0f options:UIViewAnimationOptionCurveEaseInOut
										  animations:^{
											  self.transform= CGAffineTransformMakeScale(1.2f, 1.2f);
										  }
										  completion:^(BOOL finished){
											  [UIView animateWithDuration:duration*(0.1/kImplodeDuration) delay:0.0f options:UIViewAnimationOptionCurveEaseOut
															   animations:^{
																   self.transform= CGAffineTransformMakeScale(0.01f, 0.01f);
															   }
															   completion:^(BOOL finished){
																   [self hide];
																   self.transform= CGAffineTransformIdentity;
																   completionHandler();
															   }
											   ];
										  }
						  ];
					 }
	 ];
}

- (void)implodeWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler {
	
	[self implodeWithDuration:duration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)implodeWithDuration:(NSTimeInterval)duration {
	
	[self implodeWithDuration:duration
						delay:0
					  options:0
				   completion:^{}];
}

- (void)implode:(void (^)(void))completionHandler {
	
	[self implodeWithDuration:kImplodeDuration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)implode {
	
	[self implodeWithDuration:kImplodeDuration
						delay:0
					  options:0
				   completion:^{}];
}

#pragma mark -

- (void)slideUpWithDuration:(NSTimeInterval)duration
					  delay:(NSTimeInterval)delay
					options:(UIViewAnimationOptions)options
				 completion:(void (^)(void))completionHandler {
	
	void (^animations)(void)= ^{
		self.center= CGPointMake(self.center.x, self.center.y-self.bounds.size.height);
	};
	
	[UIView animateWithDuration:duration
						  delay:delay
						options:options
					 animations:animations
					 completion:^(BOOL finished){
						 completionHandler();
					 }
	 ];
}

- (void)slideUpWithDuration:(NSTimeInterval)duration
				 completion:(void (^)(void))completionHandler {
	
	[self slideUpWithDuration:duration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)slideUpWithDuration:(NSTimeInterval)duration {
	
	[self slideUpWithDuration:duration
						delay:0
					  options:0
				   completion:^{}];
}

- (void)slideUp:(void (^)(void))completionHandler {
	
	[self slideUpWithDuration:kFadeDuration
						delay:0
					  options:0
				   completion:completionHandler];
}

- (void)slideUp {
	
	[self slideUpWithDuration:kFadeDuration
						delay:0
					  options:0
				   completion:^{}];
}

- (void)slideDownWithDuration:(NSTimeInterval)duration
						delay:(NSTimeInterval)delay
					  options:(UIViewAnimationOptions)options
				   completion:(void (^)(void))completionHandler {
	
	void (^animations)(void)= ^{
		self.center= CGPointMake(self.center.x, self.center.y+self.bounds.size.height);
	};
	
	[UIView animateWithDuration:duration
						  delay:delay
						options:options
					 animations:animations
					 completion:^(BOOL finished){
						 completionHandler();
					 }
	 ];
}

- (void)slideDownWithDuration:(NSTimeInterval)duration
				   completion:(void (^)(void))completionHandler {
	
	[self slideDownWithDuration:duration
						  delay:0
						options:0
					 completion:completionHandler];
}

- (void)slideDownWithDuration:(NSTimeInterval)duration {
	
	[self slideDownWithDuration:duration
						  delay:0
						options:0
					 completion:^{}];
}

- (void)slideDown:(void (^)(void))completionHandler {
	
	[self slideDownWithDuration:kFadeDuration
						  delay:0
						options:0
					 completion:completionHandler];
}

- (void)slideDown {
	
	[self slideDownWithDuration:kFadeDuration
						  delay:0
						options:0
					 completion:^{}];
}

@end