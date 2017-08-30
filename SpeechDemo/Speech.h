//
//  Speech.h
//  SpeechDemo
//
//  Created by Ziad Hakim on 30.08.17.
//  Copyright © 2017 Ziad Hakim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Speech : NSObject

// pitch range: [0.5 - 2.0] Default = 1.0
// rate range:  [0.0 - 1.0] Default = 0.5
- (void)speakText:(NSString *)text withRate:(float)rate pitchMultiplier:(float)pitch;

@end
