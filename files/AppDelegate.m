//
//  AppDelegate.m
//  radarstatistics
//
//  Created by Nicolas Bouilleaud on 17/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Radars.h"

@interface AppDelegate()

@property (strong) Radars* model;

@end

@implementation AppDelegate
@synthesize model;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"DebugRemoveStore"];
    self.model = [Radars new];
    [self.model downloadAndParseWholeRadarList];

    // Insert code here to initialize your application
}

@end
