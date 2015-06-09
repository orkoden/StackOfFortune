//
//  ViewController.m
//  StackOfFortune
//
//  Created by Jörg Bühmann on 09.06.15.
//  Copyright © 2015 BWDC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *fortuneStackView;
@property (strong, nonatomic) FortuneController *fortuneController;
@property (strong, nonatomic) NSMutableArray *views;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.fortuneStackView.alignment = UIStackViewAlignmentCenter;
	self.fortuneStackView.spacing = 0;
	self.fortuneStackView.alignment = UIStackViewAlignmentFill;
	self.fortuneStackView.distribution = UIStackViewDistributionFill;
	
	self.views = NSMutableArray.new;
}

-(void)viewDidAppear:(BOOL)animated
{
	self.fortuneController = FortuneController.new;
	
    for (Wisdom *wisdom in self.fortuneController.wisdoms) {
		
		UIView *view = [self textViewWithText:wisdom.author];
		[self.views addObject:view];
		[self.fortuneStackView addArrangedSubview:view];
    }
	
	[self removeColorView];
}

-(void) removeColorView
{
	[UIView animateWithDuration:0.1 animations:^{
		UIView * firstView = self.self.fortuneStackView.arrangedSubviews[0];
		firstView.hidden = YES;
	} completion:^(BOOL finished) {

		[self.self.fortuneStackView removeArrangedSubview:self.self.fortuneStackView.arrangedSubviews[0]];
		
		if (self.self.fortuneStackView.arrangedSubviews.count > 0) {
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				[self removeColorView];
			});
		}
	}];
}

-(UILabel*) textViewWithText: (NSString *) text
{
    UILabel* textV = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 50)];
    
    textV.text = text;
    textV.backgroundColor =[UIColor greenColor];
	
    return textV;
}

@end
