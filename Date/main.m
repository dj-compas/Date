//
//  main.m
//  Date
//
//  Created by Michael Compas on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DateAppDelegate.h"
#import "Date.h"
#import <limits.h>

int main(int argc, char *argv[])
{
	@autoreleasepool {
		NSLog(@"we'll print out the date soon...");
		NSLog(@"description: %@", [Date description]);
		
		// call a class method before creating an instance of the class
		// the method "yearlength" is a class method
		// it's a "static" function; presumably, it doesn't require any parameters
		//
		NSLog(@"yearlength is %d", [Date yearLength]);
		
		// create new instace of the Date class
		//
		Date *d = [[Date alloc] init];
		
		// set and get variables
		//
		d.year = 2012;
		NSLog(@"The current year is %d", d.year);
		
		[d setMonth:6];
		NSLog(@"The current month is %d \n", [d month]);
		
		// create a new instance of the Date class
		Date *myDate  = [[Date alloc] initWithMonth:9 day:29 year:1996];
		
		NSLog(@"I got my first N64 on %d/%d/%d.\n", [myDate month], [myDate day], [myDate year]);
		
		
		NSLog(@"description at end: %@", [Date description]);
		
		// test year for error
		[myDate setYear:INT_MAX];
		[myDate endOfYear];
		NSLog(@"The new year is %d", myDate.year);
		NSLog(@"incrementing year by 1...");
		[myDate next];
		
		//
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([DateAppDelegate class]));
	}
}
