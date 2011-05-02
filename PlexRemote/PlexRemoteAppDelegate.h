//
//  PlexRemoteAppDelegate.h
//  PlexRemote
//
//  Created by Luke Lanchester on 01/05/2011.
//  Copyright 2011 Luke Lanchester. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MAAttachedWindow;
@class PlexAPI;

enum {
	PR_COMMAND_MOVE_UP = 1,
	PR_COMMAND_MOVE_DOWN = 2,
	PR_COMMAND_MOVE_LEFT = 3,
	PR_COMMAND_MOVE_RIGHT = 4,
	PR_COMMAND_PAGE_UP = 5,
	PR_COMMAND_PAGE_DOWN = 6,
	PR_COMMAND_NEXT_LETTER = 7,
	PR_COMMAND_PREVIOUS_LETTER = 8,
	
	PR_COMMAND_SELECT = 101,
	PR_COMMAND_BACK = 102,
	PR_COMMAND_INFO = 103,
	
	PR_COMMAND_PLAY = 201,
	PR_COMMAND_PAUSE = 202,
	PR_COMMAND_STOP = 203,
	
	PR_COMMAND_FAST_FORWARD = 211,
	PR_COMMAND_STEP_FORWARD = 212,
	PR_COMMAND_BIG_STEP_FORWARD = 213,
	PR_COMMAND_SKIP_NEXT = 214,
	
	PR_COMMAND_REWIND = 221,
	PR_COMMAND_STEP_BACK = 222,
	PR_COMMAND_BIG_STEP_BACK = 223,
	PR_COMMAND_SKIP_PREVIOUS = 224
	
} PR_COMMANDS;


@interface PlexRemoteAppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem *statusItem;
    MAAttachedWindow *attachedWindow;
	IBOutlet NSView *view;
	PlexAPI *plexapi;
}

- (void)toggleAttachedWindowAtPoint:(NSPoint)pt;

@end