//
//  TrackPoint.h
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackPoint : NSObject {
    double m_lat;
    double m_lon;
    NSDate* when;
    double elevation;
    
}

@property (readonly) double m_lat;
@property (readonly) double m_lon;
@property (retain) NSDate* when;
@property (readwrite) double elevation;

- (id)initWithLat: (NSString*)lat Lon: (NSString*)lon;

@end
