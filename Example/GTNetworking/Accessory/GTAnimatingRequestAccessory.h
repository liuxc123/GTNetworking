//
//  GTAnimatingRequestAccessory.h
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GTBaseRequest.h"

@interface GTAnimatingRequestAccessory : NSObject <GTRequestAccessory>


@property(nonatomic, weak) UIView *animatingView;

@property(nonatomic, strong) NSString *animatingText;

- (id)initWithAnimatingView:(UIView *)animatingView;

- (id)initWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

+ (id)accessoryWithAnimatingView:(UIView *)animatingView;

+ (id)accessoryWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

@end
