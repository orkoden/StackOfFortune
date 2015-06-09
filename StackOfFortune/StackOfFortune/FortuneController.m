//
//  FortuneController.m
//  StackOfFortune
//
//  Created by Andreas Prang on 09.06.15.
//  Copyright © 2015 BWDC. All rights reserved.
//

#import "FortuneController.h"
#import "Wisdom.h"

@implementation FortuneController

- (instancetype)init
{
	self = [super init];
	if (self) {
		
		NSURL *wisdomFileURL = [[NSBundle mainBundle] URLForResource:@"wisdom" withExtension:@"txt"];
		NSString *wisdomString = [NSString stringWithContentsOfURL:wisdomFileURL encoding:NSUTF8StringEncoding error:nil];
		
		NSArray *wisdomStrings = [wisdomString  componentsSeparatedByString:@"\n%\n"];

		NSMutableArray *mutableWisdoms = NSMutableArray.new;
		for (NSString *wisdomString  in wisdomStrings) {
			
			NSArray *wisdomSubstrings = [wisdomString componentsSeparatedByString:@"		Wisdom"];
			Wisdom *wisdom = [Wisdom wisdomWithQuote:wisdomSubstrings.firstObject andAuthor:wisdomSubstrings.lastObject];
			[mutableWisdoms addObject:wisdom];
		}
		
		self.wisdoms = (NSArray *)mutableWisdoms;
	}
	return self;
}

@end
