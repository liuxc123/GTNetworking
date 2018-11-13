//
//  GTChainRequest.h
//  AFNetworking
//
//  Created by liuxc on 2018/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GTChainRequest;
@class GTBaseRequest;
@protocol GTRequestAccessory;

///  The GTChainRequestDelegate protocol defines several optional methods you can use
///  to receive network-related messages. All the delegate methods will be called
///  on the main queue. Note the delegate methods will be called when all the requests
///  of chain request finishes.
@protocol GTChainRequestDelegate <NSObject>

@optional
///  Tell the delegate that the chain request has finished successfully.
///
///  @param chainRequest The corresponding chain request.
- (void)chainRequestFinished:(GTChainRequest *)chainRequest;

///  Tell the delegate that the chain request has failed.
///
///  @param chainRequest The corresponding chain request.
///  @param request      First failed request that causes the whole request to fail.
- (void)chainRequestFailed:(GTChainRequest *)chainRequest failedBaseRequest:(GTBaseRequest*)request;

@end

typedef void (^GTChainCallback)(GTChainRequest *chainRequest, GTBaseRequest *baseRequest);

///  GTBatchRequest can be used to chain several GTRequest so that one will only starts after another finishes.
///  Note that when used inside GTChainRequest, a single GTRequest will have its own callback and delegate
///  cleared, in favor of the batch request callback.
@interface GTChainRequest : NSObject

///  All the requests are stored in this array.
- (NSArray<GTBaseRequest *> *)requestArray;

///  The delegate object of the chain request. Default is nil.
@property (nonatomic, weak, nullable) id<GTChainRequestDelegate> delegate;

///  This can be used to add several accossories object. Note if you use `addAccessory` to add acceesory
///  this array will be automatically created. Default is nil.
@property (nonatomic, strong, nullable) NSMutableArray<id<GTRequestAccessory>> *requestAccessories;

///  Convenience method to add request accessory. See also `requestAccessories`.
- (void)addAccessory:(id<GTRequestAccessory>)accessory;

///  Start the chain request, adding first request in the chain to request queue.
- (void)start;

///  Stop the chain request. Remaining request in chain will be cancelled.
- (void)stop;

///  Add request to request chain.
///
///  @param request  The request to be chained.
///  @param callback The finish callback
- (void)addRequest:(GTBaseRequest *)request callback:(nullable GTChainCallback)callback;

@end

NS_ASSUME_NONNULL_END
