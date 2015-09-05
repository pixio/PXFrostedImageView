//
//  PXFrostedImageView.h
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

#import <UIKit/UIKit.h>

#import <PXImageView/PXImageView.h>

/**
 *  A frosted image view with a colored overlay.  Capable of preblurring the image provided.
 */
@interface PXFrostedImageView : UIView

/**
 * The color to use as the tint for the frost.  By default, this is a transparent white.
 */
@property (nonatomic, copy) UIColor * frostColor;

/**
 * The image being frosted.
 */
@property (nonatomic) UIImage * image;

/**
 *  The image view the frosted image is placed into.
 */
@property (nonatomic) PXImageView * imageView;

/**
 *  The contentmode for the image in the underlying PXImageView.
 */
@property (nonatomic) PXContentMode contentMode;

/**
 *  Set the image for the frosted image view.  This image can either be a plain image which will be blurred or a pre-blurred image.
 *
 *  @param image      the image to frost
 *  @param preblurred whether or not the image has already been blurred.
 */
- (void)setImage:(UIImage *)image preblurred:(BOOL)preblurred;

@end
