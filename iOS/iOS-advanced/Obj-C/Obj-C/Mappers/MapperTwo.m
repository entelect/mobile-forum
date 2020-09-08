//
//  MapperTwo.m
//  Obj-C
//
//  Created by Armand Kamffer on 2020/09/08.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

#import "MapperTwo.h"
#import "Obj_C-Swift.h"

@interface MapperTwo()
@property (class, strong, atomic) NSDateFormatter *dateFormatter;
@end

@implementation MapperTwo

+ (NSString*)formatForDate:(NSDate*)date {
    return [self.dateFormatter stringFromDate:date];
}

+ (NSString*)formatSwiftForDate:(NSDate*)date {
    return [MapperOne formatForDate:date];
}

+ (NSString*)titleForTwoType:(MapperTwoType)type {
    switch (type) {
        case kSwift:
            return @"Two: Swift";
        case kObjC:
            return @"Two: Obj-C";
    }
}

+ (NSString*)titleForOneType:(MapperOneType)type {
    return [MapperOne titleWithOneType:MapperOneTypeSwift];
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy MMM dd";
    return dateFormatter;
}

+ (void)setDateFormatter:(NSDateFormatter *)dateFormatter {
    dateFormatter = dateFormatter;
}

@end
