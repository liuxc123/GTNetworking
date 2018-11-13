//
//  GTChainRequest+AnimatingAccessory.m
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import "GTChainRequest+AnimatingAccessory.h"
#import "GTAnimatingRequestAccessory.h"

@implementation GTChainRequest (AnimatingAccessory)

- (GTAnimatingRequestAccessory *)animatingRequestAccessory {
    for (id accessory in self.requestAccessories) {
        if ([accessory isKindOfClass:[GTAnimatingRequestAccessory class]]){
            return accessory;
        }
    }
    return nil;
}

- (UIView *)animatingView {
    return self.animatingRequestAccessory.animatingView;
}

- (void)setAnimatingView:(UIView *)animatingView {
    if (!self.animatingRequestAccessory) {
        [self addAccessory:[GTAnimatingRequestAccessory accessoryWithAnimatingView:animatingView animatingText:nil]];
    } else {
        self.animatingRequestAccessory.animatingView = animatingView;
    }
}

- (NSString *)animatingText {
    return self.animatingRequestAccessory.animatingText;
}

- (void)setAnimatingText:(NSString *)animatingText {
    if (!self.animatingRequestAccessory) {
        [self addAccessory:[GTAnimatingRequestAccessory accessoryWithAnimatingView:nil animatingText:animatingText]];
    } else {
        self.animatingRequestAccessory.animatingText = animatingText;
    }
}

@end
