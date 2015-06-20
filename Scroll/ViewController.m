//
//  ViewController.m
//  Scroll
//
//  Created by MAEDA HAJIME on 2014/04/15.
//  Copyright (c) 2014年 MAEDA HAJIME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *svScroll;

@property (weak, nonatomic) IBOutlet UIImageView *ivImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 準備処理
    [self doReady];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  UIScrollViewDelegate Method

// 設定（ズーム対象）
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.ivImage;
    
}

#pragma mark -  Own Method

// 準備処理
- (void)doReady {
    
    /*
     *ImageViewへ制約の設定が必要
     [Pin]のSpacingの値を、四方とも"0"ポイントにする。オートレイアウト機能をON
    */
    
    // 設定（デリゲート）
    self.svScroll.delegate = self;
    
    // 設定（コンテンツサイズ（スクロール範囲））
    self.svScroll.contentSize = CGSizeMake(
                                           self.ivImage.frame.size.width * 2.0,
                                           self.ivImage.frame.size.height * 2.0);
    
    // 設定（ズーム倍率の閾値）
    self.svScroll.minimumZoomScale = 1.0;
    self.svScroll.maximumZoomScale = 5.0;
    
    // 設定（ページング機能）ページ単位で動く 4ページ
    self.svScroll.pagingEnabled = YES;
}
@end
