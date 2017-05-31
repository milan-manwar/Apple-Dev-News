//
//  FeedDetailViewController.swift
//  Apple Dev News
//
//  Created by milan on 31/05/17.
//  Copyright © 2017 apps. All rights reserved.
//

/************************************************
 ************************************************
 
 Copyright [2017] [Milan Manwar - iOSCuriosity - https://github.com/iOSCuriosity]
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 ************************************************
 ************************************************/

import UIKit
import FeedKit
import SafariServices

class FeedDetailViewController: UIViewController {

    @IBOutlet var lblTitle:UILabel?
    @IBOutlet var lblPostTime:UILabel?
    @IBOutlet var contentWebView:UIWebView?

    var feedItem: RSSFeedItem?
    
    
    //MARK: View Life Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "News and Updates"
        
        setRightSideNavBarButton()

        setDataToView(receivedFeedItem: self.feedItem!)
    }

    //MARK: Data Setup Methods
    func setDataToView(receivedFeedItem:RSSFeedItem) -> Void {
        
        lblTitle?.text = receivedFeedItem.title
        
        let postDate:Date = receivedFeedItem.pubDate!
        lblPostTime?.text = "posted on \(postDate)"

        let htmlString:String = "<html><head><style type=\"text/css\">body{font-family: '-apple-system','HelveticaNeue'; font-size:13; background-color:transparent; color:#626262;}a:link { color:#0070c9; text-decoration: none; }</style></head><body>\((receivedFeedItem.content?.contentEncoded)!)</body></html>"
        
        contentWebView?.loadHTMLString(htmlString, baseURL: nil)
    }

    //MARK: - NavigationBar Button Methods
    
    func setRightSideNavBarButton() {
        
        let btnRightInfo:UIBarButtonItem = UIBarButtonItem(image: UIImage(named:"Web")!, style: .plain, target: self, action: #selector(onPressGoToButtonRightSide))
//        btnRightInfo.tintColor = UIColor(red: 0, green: 112, blue: 201, alpha: 1)
        self.navigationItem.rightBarButtonItem = btnRightInfo
    }
    
    func onPressGoToButtonRightSide() {
        
        let url:URL = URL(string: (self.feedItem?.link)!)!

        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)

    }
    
    //MARK: Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
