//
//  ACActivityIndicatorQueue.h
//
//  Created by Martin Alléus on 2009-04-19.
//  Copyright 2009 Appcorn AB. All rights reserved.
//
//	Class description:
//	--------------------------------------------
//	This class counts a queue of senders that wants to display the
//	activity indicator in the iPhone top bar. When the queue increases
//	from 0, the activity indicator is shown. It's not hidden until
//	the queue decreases to 0 again.
//	
//	Varible description:
//	--------------------------------------------
//	application:	The shared application from UIApplication
//	indicatorQueue:	The integer keeping the current length of queue
//	

#import <Foundation/Foundation.h>


@interface ACActivityIndicatorQueue : NSObject {
	UIApplication *application;
	int indicatorQueue;
}


# pragma mark --- Singleton methods ---

/* Singelton method to access the static, shared instance of the class */

+ (ACActivityIndicatorQueue *)sharedInstance;


# pragma mark --- Static convinience-methods ---

/* Convinience-method to increase the queue.
   See - addToIndicatorQueue for more information */

+ (void)startActivity;

/* Convinience-method to decrease the queue.
   See - addToIndicatorQueue for more information */

+ (void)endActivity;


# pragma mark --- Custom methods ---

/* Show the activity indicator if needed and increase the queue with one */

- (void)addToIndicatorQueue;

/* Decrease the queue with one and hide the activity indicator if needed */

- (void)removeFromIndicatorQueue;

@end
