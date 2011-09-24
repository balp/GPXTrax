//
//  GPXTraxTests.m
//  GPXTraxTests
//
//  Created by Anders Arnholm on 2011-09-24.
//  Copyright 2011 Anders Arnholm. All rights reserved.
//

#import "GPXTraxTests.h"
#import "GPSExchangeFile.h"

@implementation GPXTraxTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{

    NSData* testData = [[NSData alloc] initWithContentsOfFile:@"GPXTrax/100713-1.gpx"];
 
    GPSExchangeFile* file = [[GPSExchangeFile alloc] init];

    NSXMLParser* gpxparser = [[NSXMLParser alloc]
                              initWithData:testData];
    [gpxparser setDelegate:file];
    [gpxparser setShouldResolveExternalEntities:YES];
    bool success = [gpxparser parse];
    //NSError* error;

    //[file readFromData:testData ofType:@"gpx" error: &error];
    //STAssertNil(error, @"Error in parse: %@", error);
    STAssertTrue(success, @"Didn't parse data.");

    //STFail(@"Unit tests are not implemented yet in GPXTraxTests");
}

@end
