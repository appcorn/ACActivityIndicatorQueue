//
//  ACActivityIndicatorQueue.m
//
//  Created by Martin Alléus on 2009-04-19.
//  Copyright 2009 Appcorn AB. All rights reserved.
//

#import "ACActivityIndicatorQueue.h"


@implementation ACActivityIndicatorQueue


# pragma mark --- Singelton Methods ---

static ACActivityIndicatorQueue *activityIndicatorQueue = nil;

+ (ACActivityIndicatorQueue *)sharedInstance {
	if(activityIndicatorQueue == nil) {
		activityIndicatorQueue = [[self alloc] init];
	}
	return activityIndicatorQueue;
}

- (id)copyWithZone:(NSZone *)zone {
    return activityIndicatorQueue;
}

- (id)retain {
    return activityIndicatorQueue;
}

- (unsigned)retainCount {
    return UINT_MAX; 
}

- (id)autorelease {
    return activityIndicatorQueue;
}

- (void)release {
	// Do nothing
}


# pragma mark --- Initialization ---

- (id)init {
	[super init];
	
	application = [UIApplication sharedApplication];
	indicatorQueue = 0;
	
	return self;
}


# pragma mark --- Static convinience-methods ---

+ (void)startActivity {
	ACActivityIndicatorQueue *instace = [ACActivityIndicatorQueue sharedInstance];
	[instace addToIndicatorQueue];
}

+ (void)endActivity {
	ACActivityIndicatorQueue *instace = [ACActivityIndicatorQueue sharedInstance];
	[instace removeFromIndicatorQueue];
}


# pragma mark --- Custom Methods ---

- (void)addToIndicatorQueue {
	if(indicatorQueue == 0) {
		// First addition to the queue, show the activity indicator
		application.networkActivityIndicatorVisible = YES;
	}
	
	indicatorQueue++;
}

- (void)removeFromIndicatorQueue {
	indicatorQueue--;
	
	if(indicatorQueue <= 0) {
		// Last removal from the queue, hide the activity indicator
		application.networkActivityIndicatorVisible = NO;
	}
}

@end
