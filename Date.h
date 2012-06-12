//
//  Date.h
//  Date
//
//  Created by Michael Compas on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date: NSObject {
    int year;
    int month;	//1 to 12 inclusive
    int day;	//1 to [self monthLength] inclusive
}

- (id) initWithMonth: (int) m day: (int) d year: (int) y;
- (int) monthLength;    //Return the number of days in the Date's month.

//These three methods are "getters".
- (int) year;
- (int) month;
- (int) day;

//These three methods are "setters".
- (void) setYear: (int) y;
- (void) setMonth: (int) m;
- (void) setDay: (int) d;

- (void) next;			//Advance the Date one day into the future.
- (void) next: (int) distance;	//Advance the Date many days into the future.
+ (int) yearLength;		//Return the number of months in a year.
- (id) endOfYear;		// custom method; Set the object's date as the last day of the year
@end
