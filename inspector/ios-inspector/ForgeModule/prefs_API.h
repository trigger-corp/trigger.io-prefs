//
//  prefs_API.h
//  Forge
//
//  Created by Connor Dunn on 14/03/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface prefs_API : NSObject

+ (void)get:(ForgeTask*)task key:(NSString *)key;
+ (void)set:(ForgeTask*)task key:(NSString *)key value:(NSString *)value;
+ (void)all:(ForgeTask*)task;
+ (void)keys:(ForgeTask*)task;
+ (void)clear:(ForgeTask*)task key:(NSString *)key;
+ (void)clearAll:(ForgeTask*)task;

@end
