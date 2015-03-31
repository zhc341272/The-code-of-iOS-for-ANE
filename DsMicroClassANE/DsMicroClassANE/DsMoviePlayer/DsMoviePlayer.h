//
//  UIViewController+MoviePlayer.h
//  DsMicroClassANE
//
//  Created by zhang hongchen on 15/3/26.
//
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface DsMoviePlayer:UIViewController
{
    MPMoviePlayerViewController *mainMoviePlayerViewController;
    UIView *mainRootView;
}

- (void) setMoviePath:(NSString*) moviePath;
- (void) showModalViewController:(MPMoviePlayerViewController*) viewController;
- (void) movieFinishedCallback:(NSNotification*) notification;

@end
