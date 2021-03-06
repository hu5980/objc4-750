//
//  main.m
//  objc-test
//
//  Created by GongCF on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "JKPerson.h"
#import "JKPerson+Category1.h"
#import "JKPerson+Category2.h"
#import <malloc/malloc.h>
#import <pthread.h>

@interface Person : NSObject {
    int _age;
    int _height;
    double _no;
    
}

- (void)test;

@end

@implementation Person

@end

struct NSObject_IMPL {
    Class isa;
};

//struct Person_IMPL {
//
//    struct NSObject_IMPL NSObject_IVARS; //8
//    int _age; //4
//    int _height; //4
//    int _score; //4
//    double _no; //8
//}; // 结构体内存对其后分配的内存是 32


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //        NSObject *obj = [[NSObject alloc] init];
        //        NSLog(@"% zd",class_getInstanceSize([NSObject class]));  //8
        //        NSLog(@"%zu",malloc_size((__bridge const void *)obj)); // 16
        //
        //        printf("%lu\n",sizeof(double));
        //
        //        //  printf("%lu\n",sizeof(struct Person_IMPL));
        //        Person *person = [[Person alloc]init];
        //        //sizeof 是一个关键字 ，编译的时候就知道了
        //
        //        printf("%lu\n",sizeof(person));
        //        // 计算对象最少需要分配的内存
        //        NSLog(@"% zd",class_getInstanceSize([Person class]));  //28
        //        // 计算对象实际分配的内存
        //        NSLog(@"% zd",malloc_size((__bridge const void *)person)); //32
        //
        //        NSLog(@"%p",object_getClass([person class])); // 元类对象
        //        NSLog(@"%p", objc_getClass("Person")); // 类对象
        //        NSLog(@"%p", object_getClass(person)); // 类对象
        
        //        NSObject *obj = [[NSObject alloc] init];
        //
        //        Class cls = [obj class];
        ////        ro->instanceSize;
        //
        //        JKPerson *person = [JKPerson new];
        //
        //        [person addMethod];
        //
        //
        //        [NSObject new];
        //        for (int i = 0 ; i < 255; i++) {
        //
        //             [obj retain];
        //        }
        //         [obj retainCount];
        //
        //    }
        
        JKPerson *person = [JKPerson new];
        NSMutableArray *mutableArray = [NSMutableArray array];
        person.mutableArray = mutableArray;
        [person.mutableArray addObject:@"1"];
        
//        // 浅拷贝
//        NSString *str = @"234";
//        NSMutableString *mutableString = [str copy];
//        NSLog(@"%p  %p",str,mutableString);
        
//        // 深拷贝  因为拷贝的内存不一样了 所以是深拷贝
//        NSString *str = @"234";
//        NSMutableString *mutableString = [str mutableCopy];
//        NSLog(@"%p  %p",str,mutableString);
//        [mutableString appendString:@"456"];
        
        
//        // 这个也是深拷贝 因为调用了copywithzone 生成不可变的字符串
//        NSMutableString *str = [NSMutableString stringWithString:@"234"];
//        NSMutableString *mutableString = [str copy];
//        NSLog(@"%p  %p",str,mutableString);
       
        
//        // 深拷贝 只要调用了 mutableCopy的都是深拷贝
//        NSMutableString *str = [NSMutableString stringWithString:@"234"];
//        NSMutableString *mutableString = [str mutableCopy];
//        NSLog(@"%p  %p",str,mutableString);
//        [mutableString appendString:@"456"];
        
    }
    return 0;
}


