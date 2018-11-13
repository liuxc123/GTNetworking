//
//  GTBatchRequestAgent.h
//  AFNetworking
//
//  Created by liuxc on 2018/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GTBatchRequest;

///  GTBatchRequestAgent handles batch request management. It keeps track of all
///  the batch requests.
@interface GTBatchRequestAgent : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Get the shared batch request agent.
+ (GTBatchRequestAgent *)sharedAgent;

///  Add a batch request.
- (void)addBatchRequest:(GTBatchRequest *)request;

///  Remove a previously added batch request.
- (void)removeBatchRequest:(GTBatchRequest *)request;

@end

NS_ASSUME_NONNULL_END

