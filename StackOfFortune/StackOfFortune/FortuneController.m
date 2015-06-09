//
//  FortuneController.m
//  StackOfFortune
//
//  Created by Andreas Prang on 09.06.15.
//  Copyright © 2015 BWDC. All rights reserved.
//

#import "FortuneController.h"
@import CoreSpotlight;
@import MobileCoreServices;

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
			
			NSArray *wisdomSubstrings = [wisdomString componentsSeparatedByString:@"		-- "];

			Wisdom *wisdom = [Wisdom wisdomWithQuote:wisdomSubstrings.firstObject andAuthor:(wisdomSubstrings.firstObject != wisdomSubstrings.lastObject) ? wisdomSubstrings.lastObject : nil];
			[mutableWisdoms addObject:wisdom];
		}
	
        [self addSpotlightSearchForWisdoms:mutableWisdoms];

        
		self.wisdoms = (NSArray *)mutableWisdoms;
	}
	return self;
}

-(void) addSpotlightSearchForWisdoms: (NSArray*) wisdoms
{
    NSMutableArray* indexWisdoms = [NSMutableArray arrayWithCapacity:wisdoms.count];
    for (Wisdom* wisdom in wisdoms) {

        // Create an attribute set for an item that represents an image.
        CSSearchableItemAttributeSet* attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*) kUTTypeText];
        // Set properties that describe attributes of the item such as title, description, and image.
        attributeSet.title = wisdom.author;
        attributeSet.displayName = wisdom.author;
        if (wisdom.author && wisdom.quote) {
            attributeSet.keywords = @[wisdom.author, wisdom.quote];
        }
        attributeSet.contentDescription = wisdom.quote;
        //        Next, create a CSSearchableItem object to represent the item and add it to the index. Listing 4 shows how to create a CSSearchableItem object and index it.
        
        // Create a searchable item, specifying its ID, associated domain, and attribute set.
        CSSearchableItem* item;
        item = [[CSSearchableItem alloc] initWithUniqueIdentifier:nil domainIdentifier:@"bla.laber.com" attributeSet:attributeSet];
        // Index the item.
        [indexWisdoms addObject:item];
    }
    
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems: indexWisdoms completionHandler: ^(NSError * __nullable error) {
        NSLog(@"Search item indexed");
    }];
    
}

@end
