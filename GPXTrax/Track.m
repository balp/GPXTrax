//
//  Track.m
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import "Track.h"


@implementation Track

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


@end
