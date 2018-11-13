//
//  GTNetworking.h
//  Pods
//
//  Created by liuxc on 2018/11/13.
//

#ifndef _GTNETWORKING_
    #define _GTNETWORKING_

#if __has_include(<GTNetworking/GTNetworking.h>)

    FOUNDATION_EXPORT double GTNetworkVersionNumber;
    FOUNDATION_EXPORT const unsigned char GTNetworkVersionString[];

    #import <GTNetworking/GTRequest.h>
    #import <GTNetworking/GTBaseRequest.h>
    #import <GTNetworking/GTNetworkAgent.h>
    #import <GTNetworking/GTBatchRequest.h>
    #import <GTNetworking/GTBatchRequestAgent.h>
    #import <GTNetworking/GTChainRequest.h>
    #import <GTNetworking/GTChainRequestAgent.h>
    #import <GTNetworking/GTNetworkConfig.h>

#else

    #import "GTRequest.h"
    #import "GTBaseRequest.h"
    #import "GTNetworkAgent.h"
    #import "GTBatchRequest.h"
    #import "GTBatchRequestAgent.h"
    #import "GTChainRequest.h"
    #import "GTChainRequestAgent.h"
    #import "GTNetworkConfig.h"

    #endif /* __has_include */

#endif /* _GTNETWORKING_ */
