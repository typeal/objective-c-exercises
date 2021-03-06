//
//  BNREmployee.m
//  BMITime
//
//  Created by 谢政 on 2020/4/27.
//  Copyright © 2020 maimemo. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@interface BNREmployee () {
    NSMutableSet *_assets;
}

@property (nonatomic) unsigned int officeAlarmCode;


@end

@implementation BNREmployee

- (void)setAssets:(NSSet *)a {
    _assets = [a mutableCopy];
}

- (NSArray *) assets {
    return [_assets copy];
}

- (void) addAsset: (BNRAsset *)a {
    if (!_assets){
        _assets = [[NSMutableSet alloc] init];
    }
    
    [_assets addObject: a];
    a.holder = self;
}

//- (void) removeAsset:(BNRAsset *)a {
//    for (NSUInteger i = 0; (i = [self.assets count]); i++) {
//        if (self.assets[i] == a) {
//            [_assets removeObject: a];
//        }
//    }
//}

- (unsigned int) valueOfAssets {
    unsigned int sum = 0;
    
    for (BNRAsset *a in _assets) {
        sum += a.resaleValue;
    }
    return sum;
}

- (double)yearsOfEmployment {
    if(self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0;
    } else {
        return 0;
    }
}

- (float)bodyMassIndex {
    return ([super bodyMassIndex] * 0.9);
}

- (NSString *)description {
//    return [NSString stringWithFormat:@"<Employee %d>", self.employeeID];
    return [NSString stringWithFormat:@"<Employee %u in $%u assets>", self.employeeID, self.valueOfAssets];
}

@end
