//
//  Radars.h
//  radarstats
//
//  Created by Nicolas Bouilleaud on 17/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoreDataManager.h"

@interface Radars : CoreDataManager
- (void) downloadAndParseWholeRadarList;
@end
