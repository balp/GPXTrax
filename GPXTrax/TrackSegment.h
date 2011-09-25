//
//  TrackSegment.h
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class TrackPoint;
@class NSMutableArray;

@interface TrackSegment : NSObject {
    NSMutableArray* points;
    NSString* name;
}
@property (retain) NSString* name;

- (void) addTrackPoint: (TrackPoint*) point;

- (NSUInteger) count;

- (id)objectAtIndex:(NSUInteger)index;
- (CLLocationCoordinate2D) centerCoordinate;
- (void) makePolyLine;
@end
