//
//  PlexRemoteAppDelegate.m
//  PlexRemote
//
//  Created by Luke Lanchester on 01/05/2011.
//  Copyright 2011 Luke Lanchester. All rights reserved.
//

#import "PlexRemoteAppDelegate.h"
#import "PlexView.h"
#import "MAAttachedWindow.h"
#import "PlexAPI.h"

@implementation PlexRemoteAppDelegate

-(void)awakeFromNib{
	
    float width = 24.0;
    float height = [[NSStatusBar systemStatusBar] thickness];
    NSRect viewFrame = NSMakeRect(0, 0, width, height);
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:width] retain];
    [statusItem setView:[[[PlexView alloc] initWithFrame:viewFrame controller:self] autorelease]];
}








- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	plexapi = [[PlexAPI alloc] 
			   initWithServerURL: [NSURL URLWithString:@"http://localhost:32400"] 
			   andClientName: @"Europa.local."];
}






- (void)toggleAttachedWindowAtPoint:(NSPoint)pt {
	
    if (!attachedWindow) {
		attachedWindow = [[MAAttachedWindow alloc] initWithView:view 
                                                attachedToPoint:pt 
                                                       inWindow:nil 
                                                         onSide:MAPositionBottom 
                                                     atDistance:5.0];
		
        //[attachedWindow setBackgroundColor:[NSColor colorWithCalibratedWhite:0.1 alpha:0.75]];
		//[attachedWindow setBackgroundColor:[NSColor clearColor]];
		//[attachedWindow setViewMargin:0];
        //[attachedWindow setBorderWidth:0];
        //[attachedWindow setCornerRadius:0];
        //[attachedWindow setHasArrow:NO];
		//[attachedWindow setArrowHeight:0];
		
		[attachedWindow setLevel:NSMainMenuWindowLevel];
        [attachedWindow makeKeyAndOrderFront:self];
		
		[attachedWindow setAlphaValue:0.0];
		[NSAnimationContext beginGrouping];
		[[NSAnimationContext currentContext] setDuration:0.25];  
		[attachedWindow makeKeyAndOrderFront:self];
		[[attachedWindow animator] setAlphaValue:1.0];
		[NSAnimationContext endGrouping];
		
    } else {
		
		[attachedWindow setAlphaValue:1.0];
		[NSAnimationContext beginGrouping];
		[[NSAnimationContext currentContext] setDuration:0.2];
		[attachedWindow makeKeyAndOrderFront:self];
		[[attachedWindow animator] setAlphaValue:0.0];
		[NSAnimationContext endGrouping];
		
        //[attachedWindow orderOut:self];
        [attachedWindow release];
        attachedWindow = nil;
    }    
}















- (void) clickQuit:(id)sender {
	[NSApp terminate:sender];
}



- (IBAction) clickCommand:(id)sender {

	switch([sender tag]) {
		case PR_COMMAND_MOVE_UP:
			[plexapi sendCommand:@"moveUp" forController:@"navigation"];
			break;
		case PR_COMMAND_MOVE_DOWN:
			[plexapi sendCommand:@"moveDown" forController:@"navigation"];
			break;
		case PR_COMMAND_MOVE_LEFT:
			[plexapi sendCommand:@"moveLeft" forController:@"navigation"];
			break;
		case PR_COMMAND_MOVE_RIGHT:
			[plexapi sendCommand:@"moveRight" forController:@"navigation"];
			break;
		case PR_COMMAND_SELECT:
			[plexapi sendCommand:@"select" forController:@"navigation"];
			break;
		case PR_COMMAND_BACK:
			[plexapi sendCommand:@"back" forController:@"navigation"];
			break;
		case PR_COMMAND_INFO:
			[plexapi sendCommand:@"toggleOSD" forController:@"navigation"];
			break;
		
		case PR_COMMAND_PLAY:
			[plexapi sendCommand:@"play" forController:@"playback"];
			break;
		case PR_COMMAND_PAUSE:
			[plexapi sendCommand:@"pause" forController:@"playback"];
			break;
		case PR_COMMAND_STOP:
			[plexapi sendCommand:@"stop" forController:@"playback"];
			break;
		
		case PR_COMMAND_STEP_FORWARD:
			[plexapi sendCommand:@"stepForward" forController:@"playback"];
			break;
		case PR_COMMAND_BIG_STEP_FORWARD:
			[plexapi sendCommand:@"bigStepForward" forController:@"playback"];
			break;
		case PR_COMMAND_STEP_BACK:
			[plexapi sendCommand:@"stepBack" forController:@"playback"];
			break;
		case PR_COMMAND_BIG_STEP_BACK:
			[plexapi sendCommand:@"bigStepBack" forController:@"playback"];
			break;
			
		
		default:
			NSLog(@"clickButton miss");
	} // end switch: sender tag

}





- (void)dealloc {
    [[NSStatusBar systemStatusBar] removeStatusItem:statusItem];
    [super dealloc];
}


@end
