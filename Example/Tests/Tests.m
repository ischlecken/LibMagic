//
//  LibMagicTests.m
//  LibMagicTests
//
//  Created by Hugo Schlecken on 08/13/2014.
//  Copyright (c) 2014 Hugo Schlecken. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "magic.h"
#import "NSData+Magic.h"

@interface Tests : XCTestCase
@end

@implementation Tests

/**
 *
 */
-(void) setUp
{ [super setUp]; }

/**
 *
 */
-(void) tearDown
{ [super tearDown]; }

/**
 *
 */
-(void) test_01_Magic
{ NSString*   msg        = @"bla fasel";
  NSBundle*   mainBundle = [NSBundle bundleForClass:[self class]];
  NSString*   magicPath  = [mainBundle pathForResource:@"magic" ofType:nil];
  magic_t     magic      = magic_open(MAGIC_NONE);
  const char* filetype   = NULL;
  
  magic_load(magic, [magicPath UTF8String] );
  magic_setflags(magic, MAGIC_MIME);
  
  filetype = magic_buffer(magic, [msg UTF8String],[msg length]);
  
  NSLog(@"filetype=<%s>",filetype);
  
  magic_close(magic);
}

/**
 *
 */
-(void) test_02_mimeType
{ NSString* bla      = @"das üst\ndas haus vom Nilolaus\n";
  NSData*   data     = [[NSData alloc] initWithBytes:[bla UTF8String] length:[bla length]];
  NSString* mimeType = [data mimeType];
  
  NSLog(@"mimeType=<%@>",mimeType);
}

/**
 *
 */
-(void) test_03_mimeType
{ NSBundle* mainBundle = [NSBundle bundleForClass:[self class]];
  NSString* jpgData    = [mainBundle pathForResource:@"mimejpg01" ofType:nil];
  
  NSLog(@"jpgData=<%@>",jpgData);
  
  NSData*   data     = [[NSData alloc] initWithContentsOfFile:jpgData];
  NSString* mimeType = [data mimeType];
  
  NSLog(@"mimeType=<%@>",mimeType);
}

@end
