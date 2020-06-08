//
//  ViewController.m
//  UIDynamicItemDemo
//
//  Created by ng on 2020/6/8.
//  Copyright © 2020 ngarihealth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueView1;
@property (weak, nonatomic) IBOutlet UIView *purpseView;

@property (strong, nonatomic)UIDynamicAnimator * animator;
@property (strong, nonatomic)UIAttachmentBehavior * attachBehavior;

@end

@implementation ViewController

-(UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
        _animator.delegate = self;
    }
    return _animator;
}
-(UIAttachmentBehavior *)attachBehavior{
    if (!_attachBehavior) {
        _attachBehavior = [[UIAttachmentBehavior alloc]initWithItem:self.blueView offsetFromCenter:UIOffsetMake(-25, -25) attachedToAnchor:self.redView.frame.origin];
    }
    return _attachBehavior;
}
- (IBAction)btnClick:(UIButton *)sender {
//重力
    UIGravityBehavior * gravity = [[UIGravityBehavior alloc]initWithItems:@[self.redView]];
    gravity.angle = M_2_PI;
    gravity.magnitude = 0.3;
//    gravity.gravityDirection = CGVectorMake(1, 0);
    [self.animator addBehavior:gravity];
    //碰撞
    UICollisionBehavior * collision = [[UICollisionBehavior alloc]initWithItems:@[self.blueView,self.redView,self.blueView1,self.yellowView,self.purpseView]];
    collision.collisionMode = UICollisionBehaviorModeEverything;
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    //推力
    UIPushBehavior * push = [[UIPushBehavior alloc]initWithItems:@[self.blueView,self.redView,self.blueView1,self.yellowView,self.purpseView] mode:UIPushBehaviorModeContinuous];
    push.angle = M_PI_4;
    [self.animator addBehavior:push];
}

-(void)panGes:(UIGestureRecognizer*)sender{
    [self.attachBehavior setAnchorPoint:[sender locationInView:self.view]];
    self.redView.center = self.attachBehavior.anchorPoint;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIDynamicAnimator
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
    [self.view addGestureRecognizer:pan];
    
}
-(void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator{
    NSLog(@"=====dynamicAnimatorDidPause");
}
-(void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator{
    NSLog(@"=====dynamicAnimatorWillResume");
}

@end
