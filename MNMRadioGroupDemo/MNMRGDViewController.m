/*
 * Copyright (c) 2012 Mario Negro Martín
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
 */

#import "MNMRGDViewController.h"
#import "MNMRadioGroupValue.h"

@implementation MNMRGDViewController

#pragma mark -
#pragma mark Memory management

/**
 * Deallocates the memory occupied by the receiver.
 */
- (void)dealloc {    
    [radioGroup_ release];
    radioGroup_ = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark View lifecycle

/**
 * Called after the controller’s view is loaded into memory.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *valuesArray = [[[NSMutableArray alloc] init] autorelease];
    
    [valuesArray addObject:[[[MNMRadioGroupValue alloc] initWithValue:[UIColor redColor] andText:@"The color of fire and blood"] autorelease]];
    [valuesArray addObject:[[[MNMRadioGroupValue alloc] initWithValue:[UIColor greenColor] andText:@"Grass, the trees... nature"] autorelease]];
    [valuesArray addObject:[[[MNMRadioGroupValue alloc] initWithValue:[UIColor blueColor] andText:@"If you're sad you are probably thinking on this color. But, it's also the color of the sky"] autorelease]];
    [valuesArray addObject:[[[MNMRadioGroupValue alloc] initWithValue:[UIColor yellowColor] andText:@"The color of the sun, bright and cheerful"] autorelease]];
    
    CGFloat margin = 20.0f;
    CGFloat width = CGRectGetWidth(self.view.frame) - margin * 2.0f;
    CGFloat height = [MNMRadioGroup heightForValues:valuesArray andWidth:width];
    
    radioGroup_ = [[MNMRadioGroup alloc] initWithFrame:CGRectMake(margin, margin, width, height) andValues:valuesArray];
    radioGroup_.delegate = self;
    
    [self.view addSubview:radioGroup_];
}

/**
 * Called when the controller’s view is released from memory.
 */
- (void)viewDidUnload {
    [super viewDidUnload];
    
    [radioGroup_ release];
    radioGroup_ = nil;
}

#pragma mark -
#pragma mark MNMRadioGroupDelegate

/**
 * Tells delegate that a value has been selected
 *
 * @param value The MNMRadioGroupValue object selected
 */
- (void)MNMRadioGroupValueSelected:(MNMRadioGroupValue *)value {

    if ([value.value isKindOfClass:[UIColor class]]) {
        
        UIColor *color = [(UIColor *)value.value colorWithAlphaComponent:0.5f];
        
        self.view.backgroundColor = color;
    }
}

@end
