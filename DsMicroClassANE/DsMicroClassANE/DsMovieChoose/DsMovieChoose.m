//
//  UIViewController+DsMovieChoose.m
//  DsMicroClassANE
//
//  Created by zhang hongchen on 15/3/30.
//
//

#import "DsMovieChoose.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <DsMoviePlayer.h>
#import <FlashRuntimeExtensions.h>

@interface DsMovieChoose()

@end

@implementation DsMovieChoose

-(void) setContext:(FREContext*) ctx
{
    mainContext = ctx;
}

-(void) OpenMovieGel
{
    mainImagePicker = [[UIImagePickerController alloc] init];
    mainImagePicker.SourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    mainImagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *) kUTTypeMovie, nil];
    mainImagePicker.delegate = self;
    
    [self showModalViewController:mainImagePicker];
    
}

-(void) showModalViewController:(UIImagePickerController*) viewController
{
    mainRootView = [[[[UIApplication sharedApplication] keyWindow] rootViewController] view];
    
    [[[[[UIApplication sharedApplication] keyWindow] rootViewController] view] addSubview:viewController.view];
    [self presentViewController:viewController animated:TRUE completion:^{}];
    
}

-(void) removeModalViewController:(UIImagePickerController*) viewController
{
    [self removeFromParentViewController];
    [viewController.view removeFromSuperview];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *level = [[info objectForKey:UIImagePickerControllerMediaURL] path];
    
    NSString *code = @"FinishPickedVideo";
    
    FREDispatchStatusEventAsync(mainContext, (const uint8_t *)[code UTF8String], (const uint8_t *)[level UTF8String]);
    [self removeModalViewController:mainImagePicker];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self removeModalViewController:mainImagePicker];
}

@end