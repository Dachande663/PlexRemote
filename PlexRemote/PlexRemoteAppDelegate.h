//
//  PlexRemoteAppDelegate.h
//  PlexRemote
//
//  Created by Luke Lanchester on 01/05/2011.
//  Copyright 2011 Luke Lanchester. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PlexRemoteAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
