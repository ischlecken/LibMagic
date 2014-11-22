/*
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see http://www.gnu.org/licenses/.
 */
#import "NSData+Magic.h"
#import "magic.h"

@interface Version : NSObject
@end

@implementation Version
@end

@implementation NSData(Magic)

/**
 *
 */
+(magic_t) magicHandle
{ static magic_t magic = NULL;
  
  if( magic==NULL )
  {
    NSBundle* mainBundle = [NSBundle bundleForClass:[Version class]];
    NSString* magicPath  = [mainBundle pathForResource:@"magic" ofType:nil];
    NSLog(@"magic_version %ld",(long)magic_version());
    NSLog(@"magicPath=<%@>",magicPath);
    
    magic = magic_open(MAGIC_NONE);
    if( magic!=NULL )
      magic_load(magic, [magicPath UTF8String] );
  } /* of if */

  return magic;
}

/**
 *
 */
-(NSString*) mimeType
{ NSString*   result   = @"application/octet-stream";
  const char* filetype = NULL;
  magic_t     magic    = [NSData magicHandle];

  magic_setflags(magic, MAGIC_MIME);
  filetype = magic_buffer(magic, [self bytes],[self length]);
  
  NSLog(@"filetype=<%s>",filetype);

  if( filetype!=NULL )
    result = [NSString stringWithUTF8String:filetype];
  
  return result;
}

/**
 *
 */
-(id) guessedObjectFromMimeType
{ id result = self;
  
  return result;
}

@end
/*====================================================END-OF-FILE==========================================================*/
