//
//  TrackSegment.m
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import "TrackSegment.h"
#import "TrackPoint.h"


#import <MapKit.h>

@implementation TrackSegment

- (id)init
{
    self = [super init];
    if (self) {
        points = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) addTrackPoint: (TrackPoint*) point
{
    [points addObject: point]; 
}

- (NSUInteger) count
{
    return [points count];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [points objectAtIndex:index];
}

- (CLLocationCoordinate2D) centerCoordinate
{
    CLLocationCoordinate2D center;
    for (TrackPoint* point in points) {
        center.latitude += [point centerCoordinate].latitude;
        center.longitude += [point centerCoordinate].longitude;
    }
    center.latitude = center.latitude/[points count];
    center.longitude = center.longitude/[points count];
    return center;
}

- (NSString*) name
{
    if (nil == name) {
        TrackPoint* first = [points objectAtIndex:0];
        TrackPoint* last = [points lastObject];
        return [NSString stringWithFormat:@"%@ - %@", [first name], [last name] ];
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

- (void) makePolyLine
{
    MKMapPoint northEastPoint;
    MKMapPoint southWestPoint;
    NSUInteger nopoints = [points count];
    CLLocationCoordinate2D* coords = malloc(sizeof(CLLocationCoordinate2D) * nopoints);
    int idx = 0;
    for (TrackPoint* point in points) {
        //MKMapPoint mapPoint = MKMapPointForCoordinate(point.centerCoordinate);
        coords[idx++] = point.centerCoordinate;
    }
    MKPolyline* routeLine = [MKPolyline polylineWithCoordinates:coords count:nopoints];
}

@end
