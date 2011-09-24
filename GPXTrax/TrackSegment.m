//
//  TrackSegment.m
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import "TrackSegment.h"



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
@end
