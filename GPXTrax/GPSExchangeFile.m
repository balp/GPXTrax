//
//  GPSExchangeFile.m
//  GPXTrax
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import "GPSExchangeFile.h"
#import "Track.h"
#import "TrackPoint.h"
#import "TrackSegment.h"

#import <MapKit.h>


@implementation GPSExchangeFile

@synthesize treeview;
@synthesize mapview;

- (id)init
{
    self = [super init];
    if (self) {
        tracks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"GPSExchangeFile";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    /*
     Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    */
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    
    gpxparser = [[NSXMLParser alloc] initWithData:data];
    [gpxparser setDelegate:self];
    [gpxparser setShouldResolveExternalEntities:YES];
    bool success = [gpxparser parse];
    [treeview reloadData];
    

    
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return success;
}

+ (BOOL)autosavesInPlace
{
    return NO;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"parser start %@",  elementName);
    if ( [elementName isEqualToString:@"trkpt"]) {
        NSLog(@"New trkpt attributes %@", attributeDict);
        curTrkPnt =[[TrackPoint alloc] initWithLat: [attributeDict valueForKey:@"lat"] Lon: [attributeDict valueForKey:@"lon"] ];
    } else if ( [elementName isEqualToString:@"trkseg"]) {
        curTrkSeg = [[TrackSegment alloc] init];
        [curTrk addTrackSegment:curTrkSeg];
    } else if ( [elementName isEqualToString:@"trk"]) {
        curTrk = [[Track alloc] init];
        [tracks addObject:curTrk];
    }

    [currentStringValue setString:@""];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentStringValue) {
        // currentStringValue is an NSMutableString instance variable
        currentStringValue = [[NSMutableString alloc] initWithCapacity:50];
    }
    [currentStringValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ( [elementName isEqualToString:@"trkpt"]) {
        [curTrkSeg addTrackPoint:curTrkPnt];        
    } else if ( [elementName isEqualToString:@"ele"]) {
        curTrkPnt.elevation = [currentStringValue doubleValue];
    } else if ( [elementName isEqualToString:@"time"]) {
        NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z"];
        NSDate* date = [dateFormatter dateFromString:currentStringValue];
        curTrkPnt.when = date;
    } else if ( [elementName isEqualToString:@"name"]) {
        if (nil != curTrk) {
            [curTrk setName:currentStringValue];
        }
    } else {
        NSLog(@"parser end %@",  elementName);
    }
}


- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    if(nil == item) {
        return [tracks objectAtIndex:index];
    }
    return [item objectAtIndex:index];
}
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    return ([item count] > 0);
}
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    if(nil == item) {
        return [tracks count];
    }
    return [item count];
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item
{
    return [item name];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldSelectItem:(id)item
{
    NSLog(@"map is on %@ -> %f, %f", mapview, [mapview region].center.latitude, [mapview region].center.longitude);
    NSLog(@"map is on %@ -> %f, %f", mapview, [mapview centerCoordinate].latitude, [mapview centerCoordinate].longitude);
    NSLog(@"center map on %@ -> %f, %f", item, [item centerCoordinate].latitude, [item centerCoordinate].longitude);
    
    [mapview setCenterCoordinate:[item centerCoordinate] animated:YES];
    
    NSLog(@"map moved to %@ -> %f, %f", mapview, [mapview centerCoordinate].latitude, [mapview centerCoordinate].longitude);

    return YES;
}
@end
