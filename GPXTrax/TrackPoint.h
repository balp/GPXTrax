//
//  TrackPoint.h
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TrackPoint : NSObject {
    CLLocationCoordinate2D centerCoordinate;
    double m_lat;
    double m_lon;
    NSDate* when;
    double elevation;
    NSString* name;
    
}

@property (readonly) double m_lat;
@property (readonly) double m_lon;
@property (retain) NSDate* when;
@property (readwrite) double elevation;
@property (readonly) CLLocationCoordinate2D centerCoordinate;
@property (retain) NSString* name;

- (id)initWithLat: (NSString*)lat Lon: (NSString*)lon;
- (NSUInteger) count;
- (id)objectAtIndex:(NSUInteger)index;

@end
