//
//  Track.h
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NSMutableArray;
@class TrackSegment;

@interface Track : NSObject {
    NSMutableArray* segments;
}

- (void) addTrackSegment: (TrackSegment*) segment;

@end
