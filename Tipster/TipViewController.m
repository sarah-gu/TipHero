//
//  TipViewController.m
//  Tipster
//
//  Created by Sarah Wen Gu on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numPeopleControl;
@property (weak, nonatomic) IBOutlet UILabel *perPersonLabel;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}
- (IBAction)updateLabels:(id)sender {
    
    if (self.billField.text.length == 0 )
    {
        [self hideLabels];
//        NSString *dollarSign = @"$";
//        self.billField.text = dollarSign;
    }
    else if(self.labelsContainerView.alpha == 0){
        [self showLabels];
    }
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double numPeople[] = {1, 2, 3};
    double toDivide = numPeople[self.numPeopleControl.selectedSegmentIndex];
    
    
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    double perPerson = total / toDivide;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.perPersonLabel.text = [NSString stringWithFormat:@"$%.2f", perPerson];
 
}

//- (void)viewDidAppear:(BOOL)animated {
////    [self hideLabels];
//    [self.billField becomeFirstResponder];
//    //make the billfield.x and .y = (however much you want to move it)
//    //View with everything inside, set alpha = 0
//}

- (void)hideLabels{
    [UIView animateWithDuration:0.5 animations:^{
//        CGRect billFrame = self.billField.frame;
//       // billFrame.origin.y += 200;
//
//        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.labelsContainerView.frame = labelsFrame;
        self.labelsContainerView.alpha = 0;

    }];

}

- (void)showLabels{
    [UIView animateWithDuration:0.5 animations:^{
//        CGRect billFrame = self.billField.frame;
//        //billFrame.origin.y -= 200;
//
//        self.billField.frame = billFrame;
//
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -= 200;
        
        self.labelsContainerView.frame = labelsFrame;
        self.labelsContainerView.alpha = 1;
        self.background.alpha = 0.3;
    }];
}
@end
