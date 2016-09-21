//
//  ViewController.m
//  WebView
//
//  Created by Özcan Akbulut on 01.11.13.
//  Copyright (c) 2013 Özcan Akbulut. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                NSUserDomainMask, YES);
    NSString *arrayPath = [[paths objectAtIndex:0]
                 stringByAppendingPathComponent:@"XDYsvg.svg"];
    NSString *svgStr = @"<svg width=\"719.4244604316547\" height=\"540.5405405405405\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><g><path id=\"brush_round_0\" xmin=\"173.65\" ymin=\"151.05\" xmax=\"387.45000000000005\" ymax=\"154.45000000000002\" stroke=\"#c1272d\" stroke-width=\"2\" stroke-opacity=\"1\" d=\"M 173.65,151.05 L 176.50,151.05 L 184.95,151.05 L 196.25,151.05 L 216.00,151.05 L 249.90,151.05 L 290.85,151.05 L 321.90,152.45 L 345.90,152.45 L 364.25,152.45 L 377.00,152.45 L 381.20,152.45 L 384.05,152.45 L 385.45,152.45\" fill=\"none\"/></g></svg>";
    
    [svgStr writeToFile:arrayPath atomically:YES];//将svg字符串写入XDYsvg.svg
    
    
    self.view.backgroundColor = [UIColor blueColor];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setOpaque:NO];
    NSString *filePath = [[NSBundle mainBundle]
                          pathForResource:@"BezierCurve1" ofType:@"svg"];
    NSData *svgData = [NSData dataWithContentsOfFile:arrayPath];
                          
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *baseURL = [[NSURL alloc] initFileURLWithPath:resourcePath isDirectory:YES];
    [webView loadData:svgData
                MIMEType:@"image/svg+xml"
                textEncodingName:@"UTF-8"
                baseURL:baseURL];

    
}


- (void) webViewDidStartLoad:(UIWebView *)webView {
   
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
