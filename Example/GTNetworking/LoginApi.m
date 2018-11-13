//
//  LoginApi.m
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import "LoginApi.h"

@implementation LoginApi {
    NSString *_code;
    NSString *_phone;
}

- (id)initWithPhone:(NSString *)phone code:(NSString *)code
{
    self = [super init];
    if (self) {
        _code = code;
        _phone = phone;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"/index/index/login";
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    return @{@"User-Agent": @"APP,,iPhone,Simulator,iOS 11.3,2.2.2,,,Wifi,14,App Store,414*736,2.2",
             @"user-id": @"0"};
}

#pragma mark - Override
- (GTRequestMethod)requestMethod {
    return GTRequestMethodPOST;
}

- (GTRequestSerializerType)requestSerializerType {
    return GTRequestSerializerTypeHTTP;
}

- (GTResponseSerializerType)responseSerializerType {
    return GTResponseSerializerTypeJSON;
}

- (id)requestArgument {
    NSDictionary *param = @{ @"code": _code, @"phone": _phone, @"city_id": @"330100"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:nil];
    NSString *base64String = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64String;
}

//缓存时间<使用默认的start，在缓存周期内并没有真正发起请求>
- (NSInteger)cacheTimeInSeconds
{
    return 10;
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 60.f;
}

//- (id)jsonValidator {
//    return @{
//             @"code": [NSNumber class],
//             @"data": [NSString class],
//             @"desc": [NSString class],
//             @"time": [NSNumber class]
//             };
//}


@end
