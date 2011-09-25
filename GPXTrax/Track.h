//
//  Track.h
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class NSMutableArray;
@class TrackSegment;

@interface Track : NSObject {
    NSMutableArray* segments;
    NSString* name;
}
@property (retain) NSString* name;

- (void) addTrackSegment: (TrackSegment*) segment;
- (NSUInteger) count;
- (id)objectAtIndex:(NSUInteger)index;
- (CLLocationCoordinate2D) centerCoordinate;
@end
