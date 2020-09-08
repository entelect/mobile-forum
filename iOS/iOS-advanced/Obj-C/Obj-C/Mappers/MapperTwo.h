//
//  MapperTwo.h
//  Obj-C
//
//  Created by Armand Kamffer on 2020/09/08.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

#import <Foundation/Foundation.h>

// Swift enum needs to be forward declared
typedef NS_ENUM(NSInteger, MapperOneType);

typedef NS_ENUM(NSUInteger, MapperTwoType) {
    kSwift,
    kObjC
};

NS_ASSUME_NONNULL_BEGIN

@interface MapperTwo : NSObject

+ (nullable NSString*)formatForDate:(nonnull NSDate*)date;
+ (nullable NSString*)formatSwiftForDate:(nonnull NSDate*)date;
+ (nonnull NSString*)titleForOneType:(MapperOneType)type;
+ (nonnull NSString*)titleForTwoType:(MapperTwoType)type;

@end

NS_ASSUME_NONNULL_END
