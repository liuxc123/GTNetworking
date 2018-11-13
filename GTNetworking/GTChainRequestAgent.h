//
//  GTChainRequestAgent.h
//  AFNetworking
//
//  Created by liuxc on 2018/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GTChainRequest;

///  GTChainRequestAgent handles chain request management. It keeps track of all
///  the chain requests.
@interface GTChainRequestAgent : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Get the shared chain request agent.
+ (GTChainRequestAgent *)sharedAgent;

///  Add a chain request.
- (void)addChainRequest:(GTChainRequest *)request;

///  Remove a previously added chain request.
- (void)removeChainRequest:(GTChainRequest *)request;

@end

NS_ASSUME_NONNULL_END
