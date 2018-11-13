//
//  GTChainRequestAgent.m
//  AFNetworking
//
//  Created by liuxc on 2018/11/13.
//

#import "GTChainRequestAgent.h"
#import "GTChainRequest.h"

@interface GTChainRequestAgent()

@property (strong, nonatomic) NSMutableArray<GTChainRequest *> *requestArray;

@end

@implementation GTChainRequestAgent

+ (GTChainRequestAgent *)sharedAgent {
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

- (void)addChainRequest:(GTChainRequest *)request {
    @synchronized(self) {
        [_requestArray addObject:request];
    }
}

- (void)removeChainRequest:(GTChainRequest *)request {
    @synchronized(self) {
        [_requestArray removeObject:request];
    }
}

@end
