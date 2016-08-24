//
//  HMACGeneration.m
//  VendorApp
//
//  Created by Zubin - Nimap on 26/03/16.
//  Copyright © 2016 ChatOnGo. All rights reserved.
//

#import "HMACGeneration.h"

@implementation HMACGeneration

-(NSString *)hmac:(NSString *)plaintext withKey:(NSString *)key
{
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [plaintext cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMACData = [NSData dataWithBytes:cHMAC length:sizeof(cHMAC)];
    const unsigned char *buffer = (const unsigned char *)[HMACData bytes];
    NSMutableString *HMAC = [NSMutableString stringWithCapacity:HMACData.length * 2];
    for (int i = 0; i < HMACData.length; ++i){
        [HMAC appendFormat:@"%02x", buffer[i]];
    }
    return HMAC;
}

+(NSString *)signature:(NSString *)timeStamp
{
    NSString *signatureKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"HmacKey"];
    
    NSString *signatureValue = [NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"mobileNo"],[[NSUserDefaults standardUserDefaults] stringForKey:@"imeiNo"],timeStamp];
    
    const char *cKey  = [signatureKey cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [signatureValue cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMACData = [NSData dataWithBytes:cHMAC length:sizeof(cHMAC)];
    const unsigned char *buffer = (const unsigned char *)[HMACData bytes];
    NSMutableString *HMAC = [NSMutableString stringWithCapacity:HMACData.length * 2];
    for (int i = 0; i < HMACData.length; ++i){
        [HMAC appendFormat:@"%02x", buffer[i]];
    }
    return HMAC;
}

@end
