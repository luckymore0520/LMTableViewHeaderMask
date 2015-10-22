//
//  UITableViewCell+Mask.m
//  LMTableViewHeaderMask
//
//  Created by Kun Wang on 15/10/22.
//  Copyright © 2015年 luckymore. All rights reserved.
//

#import "UITableViewCell+Mask.h"

@implementation UITableViewCell (Mask)

- (void)maskCellFromTop:(CGFloat)margin {
    if (margin > 0) {
        self.layer.mask = [self visibilityMaskWithLocation:margin/self.frame.size.height];
        self.layer.masksToBounds = YES;
    } else {
        self.layer.mask = nil;
    }
}

- (CAGradientLayer *)visibilityMaskWithLocation:(CGFloat)location {
    CAGradientLayer *mask = [CAGradientLayer layer];
    mask.frame = self.bounds;
    mask.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:1 alpha:0] CGColor], (id)[[UIColor colorWithWhite:1 alpha:1] CGColor], nil];
    mask.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:location], [NSNumber numberWithFloat:location], nil];
    return mask;
}
@end
