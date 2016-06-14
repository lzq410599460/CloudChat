//
//  conversationViewController.swift
//  CloudChat
//
//  Created by ZL on 16/6/12.
//  Copyright © 2016年 ZL. All rights reserved.
//

import UIKit

class conversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.hidden = true
        
        self.targetId = "OSTT"
        self.conversationType = .ConversationType_PRIVATE
        title = targetId
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
