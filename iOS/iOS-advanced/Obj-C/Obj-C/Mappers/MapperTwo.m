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

+ (NSString*)formatForSwiftDate:(NSDate*)date {
    return [MapperOne formatForDate:date];
}

+ (void)titleForOneType:(MapperOneType)type completion:(void (^)(NSString* title))completion {
    [MapperOne titleWithOneType:MapperOneTypeObjC completion:^(NSString *title) {
        completion(title);
    }];
}

+ (void)titleForTwoType:(MapperTwoType)type completion:(void (^)(NSString* title))completion {
    switch (type) {
        case kSwift:
            completion(@"Two: Swift");
            break;
        case kObjC:
            completion(@"Two: Obj-C");
            break;
    }
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
