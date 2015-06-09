//
//  Wisdom.h
//  StackOfFortune
//
//  Created by Andreas Prang on 09.06.15.
//  Copyright © 2015 BWDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wisdom : NSObject

@property (nonnull, strong, nonatomic) NSString *quote;
@property (nullable, strong, nonatomic) NSString *author;

+ (nonnull instancetype)wisdomWithQuote:(nonnull NSString *)quote andAuthor:(nullable NSString *)author;

@end
