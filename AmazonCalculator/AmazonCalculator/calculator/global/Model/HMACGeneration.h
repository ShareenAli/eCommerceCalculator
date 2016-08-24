//
//  HMACGeneration.h
//  VendorApp
//
//  Created by Zubin - Nimap on 26/03/16.
//  Copyright © 2016 ChatOnGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/xattr.h>
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

@interface HMACGeneration : NSObject

+(NSString *)signature:(NSString *)timeStamp;

@end
