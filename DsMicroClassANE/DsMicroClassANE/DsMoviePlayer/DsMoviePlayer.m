//
//  UIViewController+MoviePlayer.m
//  DsMicroClassANE
//
//  Created by zhang hongchen on 15/3/26.
//
//

#import "DsMoviePlayer.h"
#import <MediaPlayer/MediaPlayer.h>

@interface DsMoviePlayer()

@end

@implementation DsMoviePlayer


- (void)setMoviePath:(NSString*) moviePath
{
    mainMoviePlayerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:moviePath]];
    
    [self showModalViewController:mainMoviePlayerViewController];
}

- (void) showModalViewController:(MPMoviePlayerViewController*) viewController
{
    mainRootView = [[[[UIApplication sharedApplication] keyWindow] rootViewController] view];
    
    [[[[[UIApplication sharedApplication] keyWindow] rootViewController] view] addSubview:viewController.view];
    [self presentMoviePlayerViewControllerAnimated:mainMoviePlayerViewController];
    MPMoviePlayerController *player = [mainMoviePlayerViewController moviePlayer];
    [player play];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:mainMoviePlayerViewController.moviePlayer];
    
}

- (void) movieFinishedCallback:(NSNotification*) notification
{
    MPMoviePlayerController *player = [notification object];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:mainMoviePlayerViewController.moviePlayer];

    [player stop];
    [self dismissMoviePlayerViewControllerAnimated];
    [mainMoviePlayerViewController.view removeFromSuperview];
    
}

@end
