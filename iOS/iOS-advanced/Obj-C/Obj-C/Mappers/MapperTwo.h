//
//  MapperTwo.h
//  Obj-C
//
//  Created by Armand Kamffer on 2020/09/08.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapperTwoType.h"

typedef NS_ENUM(NSInteger, MapperOneType);

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NSMapperTwo)
@interface MapperTwo : NSObject

+ (nullable NSString*)formatForDate:(nonnull NSDate*)date;
+ (nullable NSString*)formatForSwiftDate:(nonnull NSDate*)date NS_SWIFT_NAME(format(forSwift:));

// This function will not be visible in Swift
+ (void)titleForOneType:(MapperOneType)type completion:(void (^)(NSString* title))completion;
+ (void)titleForTwoType:(MapperTwoType)type completion:(void (^)(NSString* title))completion;

@end

NS_ASSUME_NONNULL_END
