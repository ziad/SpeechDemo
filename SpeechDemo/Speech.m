//
//  Speech.m
//  SpeechDemo
//
//  Created by Ziad Hakim on 30.08.17.
//  Copyright © 2017 Ziad Hakim. All rights reserved.
//

#import "Speech.h"

@import AVFoundation;

@interface Speech ()

@property (nonatomic, strong) AVSpeechSynthesizer  *speechSynthesizer;

@end

@implementation Speech

- (instancetype)init
{
    self = [super init];
    if (self) {
        _speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return self;
}

- (void)speakText:(NSString *)text withRate:(float)rate pitchMultiplier:(float)pitch {
    
    AVSpeechUtterance *speechUtterance = [AVSpeechUtterance speechUtteranceWithString:text];
//    speechUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"de-DE"];
    speechUtterance.rate = rate;
    speechUtterance.pitchMultiplier = pitch;
    speechUtterance.preUtteranceDelay = 0.1;
    [_speechSynthesizer speakUtterance:speechUtterance];
}

@end
