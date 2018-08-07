////
////  UIViewController+CustomBackButton.m
////  FireLife
////
////  Created by 王成龙 on 2018/8/1.
////  Copyright © 2018年 charlie. All rights reserved.
////
//
//#import "UIViewController+CustomBackButton.h"
//#import <objc/runtime.h>
//
//@implementation UIViewController (CustomBackButton)
//
//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        
//        SEL originalSelector = @selector(viewDidLoad);
//        SEL swizzledSelector = @selector(mm_viewDidLoad);
//        
//        SEL originalSelector1 = @selector(viewDidAppear:);
//        SEL swizzledSelector1 = @selector(mm_viewDidAppear);
//        
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        
//        Method originalMethod1 = class_getInstanceMethod(class, originalSelector1);
//        Method swizzledMethod1 = class_getInstanceMethod(class, swizzledSelector1);
//        
//        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//        BOOL didAddMethod1 = class_addMethod(class, originalSelector1, method_getImplementation(swizzledMethod1), method_getTypeEncoding(swizzledMethod1));
//        
//        if (didAddMethod) {
//            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//        
//        if (didAddMethod1) {
//            class_replaceMethod(class, swizzledSelector1, method_getImplementation(originalMethod1), method_getTypeEncoding(originalMethod1));
//        } else {
//            method_exchangeImplementations(originalMethod1, swizzledMethod1);
//        }
//    });
//}
//- (void)mm_viewDidLoad {
//    [self mm_viewDidLoad];
//    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:nil action:nil];
//    [self.navigationItem setBackBarButtonItem:backButtonItem];
//    
//}
//
//- (void)mm_viewDidAppear {
//    [self mm_viewDidAppear];
//
//    for (UIView *nav_back in self.navigationController.navigationBar.subviews) {
//        if ([nav_back isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
//            nav_back.userInteractionEnabled = YES;
//            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            backButton.frame = CGRectMake(20, 0, 44, 44);
//            backButton.backgroundColor =[UIColor redColor];
//            [backButton addTarget:self action:@selector(customNavBackButtonMethod) forControlEvents:UIControlEventTouchUpInside];
//            [nav_back addSubview:backButton];
//            NSLog(@"00=-%@",nav_back);
//        }
//    }
//  
//}
//
//- (void)customNavBackButtonMethod {
//    NSLog(@"000000");
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//@end
