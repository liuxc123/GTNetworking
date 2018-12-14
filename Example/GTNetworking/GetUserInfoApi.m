//
//  GetUserInfoApi.m
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import "GetUserInfoApi.h"

@implementation GetUserInfoApi{
    NSInteger _userId;
}

- (id)initWithUserId:(NSInteger)userId {
    self = [super init];
    if (self) {
        _userId = userId;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/index/user/basic_info";
}

//- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
//    return @{@"User-Agent": @"APP,,iPhone,Simulator,iOS 11.3,2.4.3,,,Wifi,20,App Store,375*812,2.2",
//             @"user-id": @"6"};
//}

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
    NSDictionary *param = @{ @"user_id": [NSNumber numberWithInteger:_userId]};
    NSData *data = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:nil];
    NSString *base64String = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64String;
}

//缓存时间<使用默认的start，在缓存周期内并没有真正发起请求>
- (NSInteger)cacheTimeInSeconds
{
    return 60 * 3;
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
