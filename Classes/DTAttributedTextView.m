//
//  DTAttributedTextView.m
//  CoreTextExtensions
//
//  Created by Oliver Drobnik on 1/12/11.
//  Copyright 2011 Drobnik.com. All rights reserved.
//

#import "DTAttributedTextView.h"
#import "DTAttributedTextContentView.h"

@implementation DTAttributedTextView

- (void)layoutSubviews
{
	self.contentView; // Trigger adding if not happened
}


- (void)dealloc 
{
	[contentView release];
    [super dealloc];
}


#pragma mark Properties
- (DTAttributedTextContentView *)contentView
{
	if (!contentView)
	{
		contentView = [[DTAttributedTextContentView alloc] initWithFrame:self.bounds];
		contentView.parentView = self;
		contentView.userInteractionEnabled = YES;
		[self addSubview:self.contentView];
	}		
	
	return contentView;
}

- (void)setString:(NSAttributedString *)string
{
	self.contentView.string = string;
	self.contentSize = contentView.bounds.size;
}

/*
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
	UIView *hitView = [super hitTest:point withEvent:event];
	NSLog(@"%@", hitView);
	return hitView;
}
 */

@synthesize string;
@synthesize contentView;


@synthesize textDelegate;

@end
