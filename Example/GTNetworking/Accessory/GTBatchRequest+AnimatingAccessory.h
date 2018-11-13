//
//  GTBatchRequest+AnimatingAccessory.h
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import <GTNetworking/GTNetworking.h>

@interface GTBatchRequest (AnimatingAccessory)

@property (weak, nonatomic) UIView *animatingView;

@property (strong, nonatomic) NSString *animatingText;

@end
