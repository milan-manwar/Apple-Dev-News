//
//  FeedDetailViewController.swift
//  Apple Dev News
//
//  Created by milan on 31/05/17.
//  Copyright © 2017 apps. All rights reserved.
//

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
