//
//  PXFrostedImageView.m
//
//  Created by Daniel Blakemore on 4/14/14.
//
//  Copyright (c) 2015 Pixio
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PXFrostedImageView.h"

#import <UIImageUtilities/UIImage+Blur.h>

#import <UIColor-MoreColors/UIColor+MoreColors.h>

@implementation PXFrostedImageView
{
    UIView * _frostOverlay;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _imageView = [PXImageView new];
        [_imageView setClipsToBounds:TRUE];
        [_imageView setContentMode:PXContentModeFill];
        [_imageView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [self addSubview:_imageView];
        
        _frostOverlay = [UIView new];
        [_frostOverlay setBackgroundColor:[UIColor halfTransparentWhite]];
        [_frostOverlay setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [self addSubview:_frostOverlay];
        
        NSDictionary* views = NSDictionaryOfVariableBindings(_imageView, _frostOverlay);
        NSDictionary* metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_imageView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_imageView]|" options:0 metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_frostOverlay]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_frostOverlay]|" options:0 metrics:metrics views:views]];
    }
    return self;
}

#pragma mark - getters and setters

- (PXContentMode)contentMode
{
    return [_imageView contentMode];
}

- (void)setContentMode:(PXContentMode)contentMode
{
    [_imageView setContentMode:contentMode];
}

- (UIImage *)image
{
    return [_imageView image];
}

- (void)setImage:(UIImage *)image
{
    [self setImage:image preblurred:FALSE];
}

- (void)setImage:(UIImage *)image preblurred:(BOOL)preblurred
{
    UIImage * finalImage = [image copy];
    if (!preblurred) {
        // blur the image first.
        finalImage = [image boxblurImageWithBlur:0.2];
    }
    [_imageView setImage:finalImage];
}

- (void)setFrostColor:(UIColor *)frostColor
{
    _frostColor = [frostColor copy];
    
    [_frostOverlay setBackgroundColor:frostColor];
}

@end
