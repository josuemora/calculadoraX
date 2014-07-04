//
//  ViewController.m
//  calculadoraX
//
//  Created by Joshua on 04/07/14.
//  Copyright (c) 2014 Joshua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lbl_tablero,memoria,memoriatablero,memoriaoperacion;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    memoriatablero = @"";
    lbl_tablero.text = memoriatablero;
    memoria = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_numeros:(id)sender {
    NSLog(@"numero %@",[sender currentTitle]);
    NSString * tablero = [[NSString alloc] initWithFormat:@"%@%@", memoriatablero,[sender currentTitle]];
    lbl_tablero.text = tablero;
    memoriatablero = tablero;
    
}

- (IBAction)btn_del:(id)sender {
    if([memoriatablero length]>0){
        lbl_tablero.text = [memoriatablero substringToIndex:[lbl_tablero.text length] - 1];
        memoriatablero = lbl_tablero.text;
    }
    
    
}
- (IBAction)btn_operacion:(id)sender {
    NSString * operacion = [[NSString alloc] initWithFormat:@"%@",[sender currentTitle] ];
    
    if ([operacion isEqualToString:@"="]) {
        operacion = memoriaoperacion;
        [self realizaoperacion:operacion];
        operacion = @"=";
        
    }else{
    [self realizaoperacion:operacion];
    }
    
    lbl_tablero.text = [[NSString alloc] initWithFormat:@"%f",memoria ];
    memoriatablero = @"";
    memoriaoperacion = operacion;
   // NSLog(@"memoria %f", memoria);
}



-(void)realizaoperacion:(NSString *)operacion{
    float ftablero = [lbl_tablero.text floatValue];

    if ([operacion isEqualToString:@"+"]) {
        memoria = memoria + ftablero;
    }
    if ([operacion isEqualToString:@"-"]) {
        memoria = memoria - ftablero;
    }
    if ([operacion isEqualToString:@"*"]) {
        memoria = memoria * ftablero;
    }
    if ([operacion isEqualToString:@"/"]) {
        memoria = memoria / ftablero;
    }

}

- (IBAction)btn_C:(id)sender {
    memoriatablero = @"";
    lbl_tablero.text = memoriatablero;
    memoria = 0;
    memoriaoperacion = @"";
}


@end
