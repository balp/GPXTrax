//
//  TrackSegment.h
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackPoint;
@class NSMutableArray;

@interface TrackSegment : NSObject {
    NSMutableArray* points;
}

- (void) addTrackPoint: (TrackPoint*) point;

- (NSUInteger) count;
@end
