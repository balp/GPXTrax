//
//  GPSExchangeFile.h
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Track;
@class TrackPoint;
@class TrackSegment;
@class MKMapView;

@interface GPSExchangeFile : NSDocument < NSXMLParserDelegate >{
    NSXMLParser* gpxparser;
    NSMutableString* currentStringValue;
    NSMutableArray* tracks;
    NSOutlineView* treeview;
    MKMapView* mapview;
    
    Track* curTrk;
    TrackPoint* curTrkPnt;
    TrackSegment* curTrkSeg;
}

@property(retain) IBOutlet NSOutlineView* treeview;
@property(retain) IBOutlet MKMapView* mapview;



@end
