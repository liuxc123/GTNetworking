//
//  GTUrlArgumentsFilter.h
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GTNetworking/GTNetworking.h>

/// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
@interface GTUrlArgumentsFilter : NSObject <GTUrlFilterProtocol>


+ (GTUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(GTBaseRequest *)request;


@end
