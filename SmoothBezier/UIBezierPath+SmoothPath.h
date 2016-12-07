//
//  UIBezierPath+SmoothPath.h
//  HobbyFort
//
//  Created by Zeacone on 2016/12/6.
//  Copyright © 2016年 zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (SmoothPath)

- (void)smoothPath:(NSArray<__kindof NSValue *> *)pointValue CurveLevel:(CGFloat)level;

@end
