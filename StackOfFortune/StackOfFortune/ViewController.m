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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.fortuneStackView.alignment = UIStackViewAlignmentCenter;
}

-(void)viewDidAppear:(BOOL)animated
{
    NSArray* texts = @[@"Hallo ich bin ein Zitat", @"asdfasdfa", @"aoyoiyiuyiuy"];
    
    [self.fortuneStackView addArrangedSubview: [self textViewWithText:@"Hallo ich bin ein Zitat"]];
    
    for (NSString* str in texts) {
        [self.fortuneStackView addArrangedSubview:[self textViewWithText:str]];
    }
	self.fortuneController = FortuneController.new;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITextView*) textViewWithText: (NSString *) text
{
    UITextView* textV = [[UITextView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 100)];
    
    textV.text = text;
    return textV;
}

@end
