//
//  YMDrawView.m
//  TouchTracker
//
//  Created by Lym on 2017/1/7.
//  Copyright © 2017年 Lym. All rights reserved.
//

#import "YMDrawView.h"
#import "YMLine.h"

@interface YMDrawView ()

@property (strong, nonatomic) YMLine *currentLine;
@property (strong, nonatomic) NSMutableArray *finishedLines;

@end

@implementation YMDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.finishedLines = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)strokeLine:(YMLine *)line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void)drawRect:(CGRect)rect
{
    //用黑色绘制已经完成的线条
    [[UIColor blackColor] set];
    for (YMLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    //用红色绘制正在画的线条
    if (self.currentLine) {
        [[UIColor redColor] set];
        [self strokeLine:self.currentLine];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    //根据触摸位置创建YMLine对象
    CGPoint location = [touch locationInView:self];
    
    self.currentLine = [[YMLine alloc] init];
    self.currentLine.begin = location;
    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    [self.finishedLines addObject:self.currentLine];
    
    self.currentLine = nil;
    
    [self setNeedsDisplay];
}

@end
