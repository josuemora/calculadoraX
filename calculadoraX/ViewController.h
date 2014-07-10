//
//  ViewController.h
//  calculadoraX
//
//  Created by Joshua on 04/07/14.
//  Copyright (c) 2014 Joshua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *lbl_tablero;
- (IBAction)btn_numeros:(id)sender;
- (IBAction)btn_del:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_operacion;
- (IBAction)btn_operacion:(id)sender;
@property float memoria;
@property (strong, nonatomic) NSString * memoriatablero;
@property (strong, nonatomic) NSString * memoriaoperacion;

-(void)realizaoperacion:(NSString *)operacion;
- (IBAction)btn_C:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tablita;
@property (strong, nonatomic) NSMutableArray * aLista;
@end
