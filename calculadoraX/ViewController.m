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
@synthesize lbl_tablero,memoria,memoriatablero,memoriaoperacion,aLista,tablita;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self btn_C:(nil)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_numeros:(id)sender {
    //NSLog(@"numero %@",[sender currentTitle]);
    NSString * tablero = [[NSString alloc] initWithFormat:@"%@%@", memoriatablero,[sender currentTitle]];
    lbl_tablero.text = tablero;
    memoriatablero = tablero;
    lbl_tablero.textColor = [UIColor blackColor];
    
}

- (IBAction)btn_del:(id)sender {
    if([memoriatablero length]>0){
        lbl_tablero.text = [memoriatablero substringToIndex:[lbl_tablero.text length] - 1];
        memoriatablero = lbl_tablero.text;
    }
    
    
}
- (IBAction)btn_operacion:(id)sender {
    NSString * operacion = [[NSString alloc] initWithFormat:@"%@",[sender currentTitle] ];
    
    [self realizaoperacion:memoriaoperacion];

    lbl_tablero.text = [[NSString alloc] initWithFormat:@"%f",memoria ];
    lbl_tablero.textColor = [UIColor greenColor];
    memoriatablero = @"";
    memoriaoperacion = operacion;
}



-(void)realizaoperacion:(NSString *)operacion{
    float ftablero = [lbl_tablero.text floatValue];
    float fmemoria = memoria;
    NSString * sLog = @"";

    
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
    if ([operacion isEqualToString:@""]) {
        memoria = ftablero;
    }

    //NSLog(@"Memoria:%f Operacion:%@ Valor:%f Resultado:%f",fmemoria, operacion, ftablero,memoria);
    sLog = [[NSString alloc] initWithFormat:@"Memoria:%f Operacion:%@ Valor:%f Resultado:%f",fmemoria, operacion, ftablero,memoria];
    [aLista addObject:sLog];
    [tablita reloadData];
   
    NSIndexPath* ipath = [NSIndexPath indexPathForRow: [aLista count]-1 inSection: 0];
    [tablita scrollToRowAtIndexPath: ipath atScrollPosition: UITableViewScrollPositionTop animated: YES];
}

- (IBAction)btn_C:(id)sender {
    memoriatablero = @"";
    memoria = 0;
    memoriaoperacion = @"";
    lbl_tablero.text = @"0";
    lbl_tablero.textColor = [UIColor blackColor];
    aLista = [[NSMutableArray alloc] initWithArray:@[]];
    [tablita reloadData];
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [aLista count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * MyCellId = @"MyCellId";
    
    UITableViewCell * cell = [self.tablita dequeueReusableCellWithIdentifier:MyCellId];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellId];
    }

    [cell.textLabel setText:[aLista objectAtIndex:[indexPath row]]];
    
    
    return cell;
}



@end
