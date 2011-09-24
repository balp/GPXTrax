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
    return self;
}

@end
