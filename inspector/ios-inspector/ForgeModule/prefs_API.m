//
//  prefs_API.m
//  Forge
//
//  Created by Connor Dunn on 14/03/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "prefs_API.h"

@implementation prefs_API

+ (void)get:(ForgeTask*)task key:(NSString *)key {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	NSString *pref = [prefs stringForKey:[@"forge_" stringByAppendingString:key]];
	
	[task success:pref];
}

+ (void)set:(ForgeTask*)task key:(NSString *)key value:(NSString *)value {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	[prefs setObject:value forKey:[@"forge_" stringByAppendingString:key]];
	[prefs synchronize];
	[task success:nil];
}

+ (void)all:(ForgeTask*)task {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
	
	for (NSString *key in [prefs dictionaryRepresentation]) {
		if ([key hasPrefix:@"forge_"]) {
			[dict setValue:[prefs objectForKey:key] forKey:[key substringFromIndex:6]];
		}
	}
	[task success:dict];
}

+ (void)keys:(ForgeTask*)task {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	NSMutableArray *keys = [NSMutableArray arrayWithCapacity:0];
	
	for (NSString *key in [[prefs dictionaryRepresentation] allKeys]) {
		if ([key hasPrefix:@"forge_"]) {
			[keys addObject:[key substringFromIndex:6]];
		}
	}
	[task success:keys];	
}

+ (void)clear:(ForgeTask*)task key:(NSString *)key {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	[prefs removeObjectForKey:[@"forge_" stringByAppendingString:key]];
    [prefs synchronize];
	[task success:nil];
}

+ (void)clearAll:(ForgeTask*)task {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	for (NSString *key in [[prefs dictionaryRepresentation] allKeys]) {
		if ([key hasPrefix:@"forge_"]) {
			[prefs removeObjectForKey:key];
		}
	} 
    [prefs synchronize];
	[task success:nil];
}

@end
