//
//  GTViewController.m
//  GTNetworking
//
//  Created by liuxc123 on 11/13/2018.
//  Copyright (c) 2018 liuxc123. All rights reserved.
//

#import "GTViewController.h"
#import "GetUserInfoApi.h"
#import "LoginApi.h"
#import <GTNetworking/GTNetworking.h>

@interface GTViewController () <GTChainRequestDelegate>

@end

@implementation GTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self getUserInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//单独接口
- (void)getUserInfo {
    GetUserInfoApi *api = [[GetUserInfoApi alloc] initWithUserId:202];
    if ([api loadCacheWithError:nil]) {
        NSDictionary *json = [api responseJSONObject];
        NSLog(@"json = %@", json);
        // show cached data
    }

    [api startWithCompletionBlockWithSuccess:^(__kindof GTBaseRequest * _Nonnull request) {
        NSLog(@"update ui");
        NSLog(@"%@", request.responseString);

    } failure:^(__kindof GTBaseRequest * _Nonnull request) {
        NSLog(@"failed");
        NSLog(@"%@", request.error.description);
    }];

}

- (void)login {
    LoginApi *api = [[LoginApi alloc] initWithPhone:@"18345405487" code:@"123456"];

    [api startWithCompletionBlockWithSuccess:^(__kindof GTBaseRequest * _Nonnull request) {
        NSLog(@"update ui");
        NSLog(@"%@", request.responseString);
    } failure:^(__kindof GTBaseRequest * _Nonnull request) {
        NSLog(@"failed");
        NSLog(@"%@", request.error.description);
    }];
}

//链式请求
- (void)sendChainRequest {
    GetUserInfoApi *api = [[GetUserInfoApi alloc] initWithUserId:202];
    GTChainRequest *chainReq = [[GTChainRequest alloc] init];
    [chainReq addRequest:api callback:^(GTChainRequest * _Nonnull chainRequest, GTBaseRequest * _Nonnull baseRequest) {
        GetUserInfoApi *result = (GetUserInfoApi *)baseRequest;
        NSLog(@"%@", result.responseString);

        GetUserInfoApi *api1 = [[GetUserInfoApi alloc] initWithUserId:202];
        [chainRequest addRequest:api1 callback:^(GTChainRequest * _Nonnull chainRequest, GTBaseRequest * _Nonnull baseRequest) {
            NSLog(@"%@", result.responseString);
        }];
    }];

    chainReq.delegate = self;
    // start to send request
    [chainReq start];
}

- (void)chainRequestFinished:(GTChainRequest *)chainRequest {

}

- (void)chainRequestFailed:(GTChainRequest *)chainRequest failedBaseRequest:(GTBaseRequest *)request {
    NSLog(@"%@", request.error.description);
}



//批次请求
- (void)sendBatchRequest {
    GetUserInfoApi *api1 = [[GetUserInfoApi alloc] initWithUserId:202];
    GetUserInfoApi *api2 = [[GetUserInfoApi alloc] initWithUserId:202];
    GetUserInfoApi *api3 = [[GetUserInfoApi alloc] initWithUserId:202];
    GetUserInfoApi *api4 = [[GetUserInfoApi alloc] initWithUserId:202];

    GTBatchRequest *batchRequest = [[GTBatchRequest alloc] initWithRequestArray:@[api1, api2, api3, api4]];
    [batchRequest startWithCompletionBlockWithSuccess:^(GTBatchRequest * _Nonnull batchRequest) {
        NSLog(@"succeed");
        NSArray *requests = batchRequest.requestArray;
        GetUserInfoApi *a = (GetUserInfoApi *)requests[0];
        GetUserInfoApi *b = (GetUserInfoApi *)requests[1];
        GetUserInfoApi *c = (GetUserInfoApi *)requests[2];
        GetUserInfoApi *d = (GetUserInfoApi *)requests[3];

        // deal with requests result ...
        NSLog(@"%@, %@, %@, %@", a, b, c, d);

    } failure:^(GTBatchRequest * _Nonnull batchRequest) {
        NSLog(@"failed");
    }];

}




@end
