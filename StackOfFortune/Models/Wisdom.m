//
//  Wisdom.m
//  StackOfFortune
//
//  Created by Andreas Prang on 09.06.15.
//  Copyright © 2015 BWDC. All rights reserved.
//

#import "Wisdom.h"

@implementation Wisdom

+ (nonnull instancetype)wisdomWithQuote:(nonnull NSString *)quote andAuthor:(nullable NSString *)author
{

	Wisdom *wisdom = [[Wisdom alloc] init];
	if (wisdom) {
		wisdom.quote = quote;
		
		if (author.length) {
			wisdom.author = author;
		}
	}
	
	return wisdom;
}

- (NSString *)debugDescription
{
	return self.description;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"Quote: %@\nAuthor: %@\n", self.quote, self.author];
}

@end
