#ifdef __OBJC__
#import <Foundation/Foundation.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FlurryWatch.h"
#import "Flurry.h"
#import "FlurryConsent.h"
#import "FlurrySessionBuilder.h"

FOUNDATION_EXPORT double Flurry_iOS_SDKVersionNumber;
FOUNDATION_EXPORT const unsigned char Flurry_iOS_SDKVersionString[];

