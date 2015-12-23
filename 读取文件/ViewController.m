//
//  ViewController.m
//  读取文件
//
//  Created by 刘浩浩 on 15/10/13.
//  Copyright © 2015年 Codeliu. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    NSString * countryString  = [NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/COUNTRY.txt",[[NSBundle mainBundle]resourcePath]] encoding:NSUTF8StringEncoding error:nil];


    
    NSArray * countryArray = [countryString componentsSeparatedByString:@",\n"];
    
    NSMutableArray * frontArray = [[NSMutableArray alloc]init];
    NSMutableArray * backArray = [[NSMutableArray alloc]init];
    
    for (NSString * s in countryArray) {
        NSArray * subArray = [s componentsSeparatedByString:@":"];
        NSMutableString *front=subArray[0];
        NSMutableString *back=subArray[1];
        NSString *frontStr=[front substringWithRange:NSMakeRange(1, front.length-2)];
        NSString *backStr=[back substringWithRange:NSMakeRange(1, back.length-2)];
        [frontArray addObject:frontStr];
        [backArray addObject:backStr];
        NSLog(@"%@",frontStr);
        NSLog(@"%@",backStr);
    }


}
+(NSString *)countNumAndChangeformat:(NSString *)num
{
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
