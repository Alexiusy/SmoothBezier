//
//  UIBezierPath+SmoothPath.m
//  HobbyFort
//
//  Created by Zeacone on 2016/12/6.
//  Copyright © 2016年 zeacone. All rights reserved.
//

#import "UIBezierPath+SmoothPath.h"

@implementation UIBezierPath (SmoothPath)

- (void)smoothPath:(NSArray<__kindof NSValue *> *)pointValue CurveLevel:(CGFloat)level {
    
    NSAssert(1.0>level>0.0, @"wrong number.");
    
    if (pointValue.count <= 1) {
        NSLog(@"Don't have enough points.");
        return;
    }
    
    CGPoint lastPoint, nextPoint;
    
    
    for (NSInteger i = 0; i < pointValue.count; i++) {
        
        CGPoint point = pointValue[i].CGPointValue;
        
        if (i == 0) {
            [self moveToPoint:point];
        } else if (i == pointValue.count-1) {
            [self addLineToPoint:point];
        } else {
            
            
            lastPoint = pointValue[i-1].CGPointValue;
            nextPoint = pointValue[i+1].CGPointValue;
            
            // 判断是否是在同一条直线上
            BOOL collinear = [self isThreePointCollinear:point PointB:lastPoint PointC:nextPoint];
            
            if (collinear) {
                [self addLineToPoint:point];
            } else {
                
                // 计算中点
                CGPoint last_center = CGPointMake((lastPoint.x+point.x)/2, (lastPoint.y+point.y)/2);
                CGPoint next_center = CGPointMake((nextPoint.x+point.x)/2, (nextPoint.y+point.y)/2);
                
                // 在当前点的前后都计算出一个新的连接点，原本的点作为control point连接curve
                CGPoint temp_last_point = CGPointMake(level*(last_center.x-point.x)+point.x, level*(last_center.y-point.y)+point.y);
                CGPoint temp_next_point = CGPointMake(level*(next_center.x-point.x)+point.x, level*(next_center.y-point.y)+point.y);
                
                [self addLineToPoint:temp_last_point];
                [self addQuadCurveToPoint:temp_next_point controlPoint:point];
            }
        }
    }
}

- (BOOL)isThreePointCollinear:(CGPoint)a PointB:(CGPoint)b PointC:(CGPoint)c {
    
    CGFloat area = 1.0/2.0 * ((a.x-c.x)*(b.y-c.y) - (b.x-c.x)*(a.y-c.y));
    if (area == 0) {
        return YES;
    }
    return NO;
}

@end
