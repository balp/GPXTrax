//
//  TrackPoint.m
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import "TrackPoint.h"

@implementation TrackPoint

@synthesize m_lat;
@synthesize m_lon;
@synthesize when;
@synthesize elevation;
@synthesize centerCoordinate;


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithLat: (NSString*)lat Lon: (NSString*)lon
{
    self = [super init];
    m_lat = [lat doubleValue];
    m_lon = [lon doubleValue];
    centerCoordinate.latitude = m_lat;
    centerCoordinate.longitude = m_lon;
    return self;
}

- (NSUInteger) count
{
    return 0;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return nil;
}

- (NSString*) name
{
    if (nil == name) {
        if(when) {
            NSDateFormatter* format = [[NSDateFormatter alloc] init];
            [format setDateStyle:NSDateFormatterNoStyle];
            [format setTimeStyle:NSDateFormatterShortStyle];
            return [format stringFromDate:when];
        }
        return @"point";
    }
    return name;
}

- (void) setName:(NSString *)nameValue
{
    if (name != nameValue)
    {
        [nameValue retain];
        [name release];
        name = nameValue;
    }
}
@end
