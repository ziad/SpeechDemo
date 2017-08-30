//
//  ViewController.m
//  SpeechDemo
//
//  Created by Ziad Hakim on 30.08.17.
//  Copyright © 2017 Ziad Hakim. All rights reserved.
//

#import "ViewController.h"
#import "Speech.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIStepper *stepperRate;
@property (weak, nonatomic) IBOutlet UIStepper *stepperPitch;
@property (assign, nonatomic) float rate;
@property (assign, nonatomic) float pitch;
@property (strong, nonatomic) Speech *speechObj;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;
@property (strong, nonatomic) IBOutlet UILabel *pitchLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _speechObj = [[Speech alloc] init];
    _rate = 0.5;
    _pitch = 1.0;
    _textField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)speakButton:(id)sender {
    NSString *text = _textField.text;
    if ([text length] > 0) {
        [_textField resignFirstResponder];
        [_speechObj speakText:text withRate:_rate pitchMultiplier:_pitch];
    }
    
}

- (IBAction)changeRate:(id)sender {
    
    double value = [(UIStepper *)sender value] / 100.0;
    _rate = value;
    _rateLabel.text = [[NSString alloc] initWithFormat:@"%.2f", _rate];
}

- (IBAction)changePitch:(id)sender {
    
    double value = [(UIStepper *)sender value] / 10.0;
    _pitch = value;
    _pitchLabel.text = [[NSString alloc] initWithFormat:@"%.2f", _pitch];
}

- (IBAction)reset:(id)sender {
    _stepperRate.value = 50;
    _stepperPitch.value = 10;
    _rate = 0.5;
    _pitch = 1.0;
    
    _rateLabel.text = [[NSString alloc] initWithFormat:@"%.2f", _rate];
    _pitchLabel.text = [[NSString alloc] initWithFormat:@"%.2f", _pitch];
    
}

#pragma mark <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
