//
//  PhyPhyBalanceAppDelegate.h
//  PhyPhyBalance
//
//  Created by 菊川 真理子 on 11/06/25.
//  Copyright 2011 北陸先端科学技術大学院大学. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PhyPhyBalanceAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSImage* _image;
	NSMutableString* _path;
	int _same;
	int _diff;
	int _count;
	int _current;
	IBOutlet NSImageView* _imageView;
	IBOutlet NSButton* _sameButton;
	IBOutlet NSButton* _diffButton;
}

-(IBAction)sameGause:(id)sender;
-(IBAction)diffGause:(id)sender;
-(void)judgeCompare;
-(void)setCompareImage;
-(void)setSameImage;
-(void)setFinishImage;

@property (assign) IBOutlet NSWindow *window;

@end
