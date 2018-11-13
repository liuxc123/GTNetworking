//
//  LoginApi.h
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTRequest.h"

@interface LoginApi : GTRequest

- (id)initWithPhone:(NSString *)phone code:(NSString *)code;

@end
