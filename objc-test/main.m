//
//  main.m
//  objc-test
//
//  Created by GongCF on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <malloc/malloc.h>


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
        NSObject *obj = [[NSObject alloc] init];
        NSLog(@"% zd",class_getInstanceSize([NSObject class]));  //8
        NSLog(@"%zu",malloc_size((__bridge const void *)obj)); // 16
        
        printf("%lu\n",sizeof(double));
        
        //  printf("%lu\n",sizeof(struct Person_IMPL));
        Person *person = [[Person alloc]init];
        //sizeof 是一个关键字 ，编译的时候就知道了
        
        printf("%lu\n",sizeof(person));
        // 计算对象最少需要分配的内存
        NSLog(@"% zd",class_getInstanceSize([Person class]));  //28
        // 计算对象实际分配的内存
        NSLog(@"% zd",malloc_size((__bridge const void *)person)); //32
        
        NSLog(@"%p",object_getClass([person class])); // 元类对象
        NSLog(@"%p", objc_getClass("Person")); // 类对象
        NSLog(@"%p", object_getClass(person)); // 类对象
        
        
    }
    return 0;
}


