//
//  PhyPhyBalanceAppDelegate.m
//  PhyPhyBalance
//
//  Created by 菊川 真理子 on 11/06/25.
//  Copyright 2011 北陸先端科学技術大学院大学. All rights reserved.
//

#import "PhyPhyBalanceAppDelegate.h"

@implementation PhyPhyBalanceAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	_same = -1;
	_diff = 10;
	_count = 0;
	[self setCompareImage];
}
-(IBAction)sameGause:(id)sender{
	if (_current > _same) {
		_same = _current;
	}
	[self judgeCompare];
}

-(IBAction)diffGause:(id)sender{
	if (_current < _diff && _current != 0) {
		_diff = _current;
	}
	[self judgeCompare];
}

-(void)judgeCompare{
	_count++;
	if(_diff-_same <= 1)
		[self setFinishImage];
	else if (_count % 3 == 0) 
		[self setSameImage];
	else
		[self setCompareImage];
}

-(void)setCompareImage{
	srand(time(nil));
	_current = _same+1 + rand()%(_diff-_same-1); 
	_path = [[NSMutableString alloc] initWithFormat:@"../../images/0-%d.png",_current];
	_image = [[NSImage alloc] initWithContentsOfFile:_path];
	[_imageView setImage:_image];
	NSLog(@"current:%d,same:%d,diff:%d\n",_current,_same,_diff);
}

-(void)setSameImage{
	_path = [[NSMutableString alloc] initWithString:@"../../images/0-0.png"];
	_image = [[NSImage alloc] initWithContentsOfFile:_path];
	[_imageView setImage:_image];
	
}
-(void)setFinishImage{
	_path = [[NSMutableString alloc] initWithString:@"../../images/Finish.png"];
	_image = [[NSImage alloc] initWithContentsOfFile:_path];
	[_imageView setImage:_image];
	[_sameButton setEnabled:NO];
	[_diffButton setEnabled:NO];
	NSLog(@"FinalDiff:%d",_diff);
}

@end
