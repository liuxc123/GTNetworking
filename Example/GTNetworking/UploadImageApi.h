//
//  UploadImageApi.h
//  GTNetworking_Example
//
//  Created by liuxc on 2018/11/13.
//  Copyright © 2018 liuxc123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GTNetworking/GTNetworking.h>

@interface UploadImageApi : GTRequest

- (id)initWithImage:(UIImage *)image;

- (NSString *)responseImageId;

@end
