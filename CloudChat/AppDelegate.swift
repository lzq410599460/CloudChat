//
//  AppDelegate.swift
//  CloudChat
//
//  Created by ZL on 16/6/9.
//  Copyright © 2016年 ZL. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?

    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        let user = RCUserInfo()
        user.userId = userId
        
        switch userId
        {
            case "OST":
                print(user.userId)
            user.name = "kk41"
            user.portraitUri = "http://f.picphotos.baidu.com/album/s%3D900%3Bq%3D90/sign=377a79d2d6ca7bcb797bcb2f8e321a5e/94cad1c8a786c9173a4a1228c83d70cf3bc75751.jpg"
            
            case "OSTT":
                print(user.userId)
            user.name = "kk42"
            user.portraitUri = "http://b.picphotos.baidu.com/album/s%3D1600%3Bq%3D90/sign=9b1fcc204b90f60300b098410922886a/9a504fc2d5628535f440923091ef76c6a7ef637a.jpg"
            
        default:
            print("no user")
        
        }
        
        completion(user)
        
    }

    
    func connectServer (completion:()->Void)
    {
        //初始化appkey
        RCIM.sharedRCIM().initWithAppKey("0vnjpoadnsy4z")
        
        //用token测试链接
        RCIM.sharedRCIM().connectWithToken("mT+xVZxfBqQjgAX5SJd8jgJbDGSDOhRC01xsRxcERGJ0ZydkWTekVwCtsbBss9XWLmpnbyOPNyK6C+Snl1wv6w==",
               success: {(userId)-> Void in
               print("connected with ID:\(userId)")
                                            
               let user = RCUserInfo(userId: "OST", name: "kk41", portrait: "http://f.picphotos.baidu.com/album/s%3D900%3Bq%3D90/sign=377a79d2d6ca7bcb797bcb2f8e321a5e/94cad1c8a786c9173a4a1228c83d70cf3bc75751.jpg")
               RCIMClient.sharedRCIMClient().currentUserInfo = user
            
                
                dispatch_async(dispatch_get_main_queue(),{ () -> Void in completion() } )
                                            
            }, error: { (status) -> Void in
                print("can't connect with error code:\(status.rawValue)")
            }, tokenIncorrect: {
                print("token error")
        })
    }
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
    
        //设置用户信息提供者
        RCIM.sharedRCIM().userInfoDataSource = self
        
        
       
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

