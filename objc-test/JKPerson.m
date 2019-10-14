//
//  JKPerson.m
//  objc-test
//
//  Created by gavin hu on 2019/4/8.
//

#import "JKPerson.h"

@implementation JKPerson

- (void)setMutableArray:(NSMutableArray *)mutableArray {
    _mutableArray = [mutableArray mutableCopy];
}

@end
