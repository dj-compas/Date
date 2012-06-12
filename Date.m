//
//  Date.m
//  Date
//
//  Created by Michael Compas on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Date.h"
#import <limits.h>

@implementation Date

//Put the date specified by the three arguments into the newborn Date object.

- (id) initWithMonth: (int) m day: (int) d year: (int) y {
    //Send the init message to the superclass object in myself.
    self = [super init];
    if (self != nil) {
        self.year = y;
        self.month = m;
        self.day = d;
    }
	
    return self;
}

//Put today's date into the newborn Date object.

- (id) init {
    self = [super init];
    if (self != nil) {
        NSCalendar *calendar =
		[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
		
        NSDate *today = [[NSDate alloc] init];
        NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
        NSDateComponents *components = [calendar components: unitFlags fromDate: today];
		
        year  = components.year;
        month = components.month;
        day   = components.day;
    }
	
    return self;
}

//Return the number of days in the month instance variable (1 to 31 inclusive).

- (int) monthLength {
	
    NSCalendar *calendar = [[NSCalendar alloc]
							initWithCalendarIdentifier: NSGregorianCalendar
							];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear: year];
    [components setMonth: month];
    [components setDay: day];
	
    NSRange range = [calendar			//r is a structure, not an object
					 rangeOfUnit: NSDayCalendarUnit
					 inUnit: NSMonthCalendarUnit
					 forDate: [calendar dateFromComponents: components]
					 ];
	
    return range.length;
}

- (NSString *) description {
    return [NSString stringWithFormat: @"%d/%d/%d", month, day, year];
}

- (int) year {
    return year;
}

- (int) month {
    return month;
}

- (int) day {
    return day;
}

- (void) setYear: (int) y {
    year = y;
}

- (void) setMonth: (int) m {
    if (m < 1 || m > 12) {	//|| means "(non-bitwise) or"
        NSLog(@"setMonth: bad month %d", m);
        return;
    }
	
    month = m;
}

- (void) setDay: (int) d {
    if (d < 1 || d > [self monthLength]) {
        NSLog(@"setDay: bad day %d with month %d", d, month);
        return;
    }
	
    day = d;
}

//Return YES if this Date is equal to the other Date, NO otherwise.

- (BOOL) isEqual: (Date *) another {
    return year == another.year 
	&& month == another.month	//&& means "(non-bitwise) and"
	&& day == another.day;
}

//Advance the Date one day into the future.
//This method accepts no arguments.

- (void) next {
    if (day < [self monthLength]) {
        ++day;
        return;
    }
	
    day = 1;
    if (month < [Date yearLength]) {
        ++month;
        return;
    }
	
    month = 1;
	if (year < INT_MAX)
	{
		++year;
		return;
	}
	else if (year == INT_MAX) {
		NSLog(@"Can't increment year; maximum int reached!");
	}
}

/*
 Advance the Date many days into the future.
 This method accepts one argument.
 It does the bulk of its work by calling the above method over and over.
 */

- (void) next: (int) distance {
    if (distance < 0) {
        NSLog(@"argument %d of next: must be non-negative", distance);
        return;
    }
	
    for (int i = 1; i <= distance; ++i) {
        [self next];
    }
}

// Return the number of months in a year.  A class method is marked with a plus.

+ (int) yearLength {
    return 12;
}

// custom function; set month and day to that of the last of the year

- (id) endOfYear {
	self.month = 12;
	self.day = 31;
	
	return self;
}

@end