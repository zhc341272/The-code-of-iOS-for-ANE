//
//  UIViewController+DsMovieChoose.h
//  DsMicroClassANE
//
//  Created by zhang hongchen on 15/3/30.
//
//

#import <UIKit/UIKit.h>
#import <FlashRuntimeExtensions.h>

@interface DsMovieChoose:UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIImagePickerController *mainImagePicker;
    UIView *mainRootView;
    FREContext *mainContext;
}

-(void) setContext:(FREContext*) ctx;
-(void) OpenMovieGel;
-(void) showModalViewController:(UIImagePickerController*) viewController;
-(void) removeModalViewController:(UIImagePickerController*) viewController;

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker;

@end
