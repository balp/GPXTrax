//
//  Track.m
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import "Track.h"
#import "TrackSegment.h"
#import <CoreLocation/CoreLocation.h>

@implementation Track
@synthesize name;

- (id)init
{
    self = [super init];
    if (self) {
        segments = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) addTrackSegment: (TrackSegment*) segment
{
    [segments addObject:segment];
}

- (NSUInteger) count
{
    return [segments count];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [segments objectAtIndex:index];
}

- (CLLocationCoordinate2D) centerCoordinate
{
    CLLocationCoordinate2D center;
    for (TrackSegment* segment in segments) {
        center.latitude += [segment centerCoordinate].latitude;
        center.longitude += [segment centerCoordinate].longitude;
    }
    center.latitude = center.latitude/[segments count];
    center.longitude = center.longitude/[segments count];
    return center;
}
@end
