//
//  ConversationListViewController.swift
//  CloudChat
//
//  Created by ZL on 16/6/13.
//  Copyright © 2016年 ZL. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        appDelegate?.connectServer({ () -> Void in
            
            self.setDisplayConversationTypes(
                [RCConversationType.ConversationType_PRIVATE.rawValue]
            )
            
            self.refreshConversationTableViewIfNeeded()
        
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        
        let conversation = RCConversationViewController()
        conversation.targetId = model.targetId
        conversation.title = conversation.targetId
        conversation.conversationType = RCConversationType.ConversationType_PRIVATE
        
        self.navigationController?.pushViewController(conversation, animated: true)
        
        self.tabBarController?.tabBar.hidden = true
    }

}
