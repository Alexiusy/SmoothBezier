# SmoothBezier ![pod](https://img.shields.io/badge/pod-v1.0.0-blue.svg)![license](https://img.shields.io/badge/license-MPL--2.0-green.svg) 

SmoothBezier is a category of UIBezierPath, which can help you create smooth bezier path.



### Usage

First of all, you should import header file to your source file.

`#import <UIBezierPath+SmoothBezier.h>`

And then follow the code below.

```objective-c
UIBezierPath *bezierPath = [UIBezierPath bezierPath];
// pointValues is an array that stores point.
[bezierPath smoothPath:pointValues CurveLevel:0.6];
```

It's done. Now you get a smooth bezier path.