//
//  GTBatchRequestAgent.m
//  AFNetworking
//
//  Created by liuxc on 2018/11/13.
//

#import "GTBatchRequestAgent.h"
#import "GTBatchRequest.h"

@interface GTBatchRequestAgent()

@property (strong, nonatomic) NSMutableArray<GTBatchRequest *> *requestArray;

@end

@implementation GTBatchRequestAgent

+ (GTBatchRequestAgent *)sharedAgent {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _requestArray = [NSMutableArray array];
    }
    return self;
}

- (void)addBatchRequest:(GTBatchRequest *)request {
    @synchronized(self) {
        [_requestArray addObject:request];
    }
}

- (void)removeBatchRequest:(GTBatchRequest *)request {
    @synchronized(self) {
        [_requestArray removeObject:request];
    }
}

@end

