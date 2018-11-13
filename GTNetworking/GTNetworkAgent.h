//
//  GTNetworkAgent.h
//  AFNetworking
//
//  Created by liuxc on 2018/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GTBaseRequest;

///  GTNetworkAgent is the underlying class that handles actual request generation,
///  serialization and response handling.
@interface GTNetworkAgent : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Get the shared agent.
+ (GTNetworkAgent *)sharedAgent;

///  Add request to session and start it.
- (void)addRequest:(GTBaseRequest *)request;

///  Cancel a request that was previously added.
- (void)cancelRequest:(GTBaseRequest *)request;

///  Cancel all requests that were previously added.
- (void)cancelAllRequests;

///  Return the constructed URL of request.
///
///  @param request The request to parse. Should not be nil.
///
///  @return The result URL.
- (NSString *)buildRequestUrl:(GTBaseRequest *)request;

@end

NS_ASSUME_NONNULL_END
