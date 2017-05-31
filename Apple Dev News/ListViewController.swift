//
//  ListViewController.swift
//  Apple Dev News
//
//  Created by milan on 30/05/17.
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

let url = URL(string: "https://developer.apple.com/news/rss/news.rss")!

class ListViewController: UIViewController {

    var feed: RSSFeed?
    @IBOutlet var tblView:UITableView?

    //MARK: - View Life Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "News and Updates"

        setLeftSideNavBarButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Run parsing in a background thread
            FeedParser(URL: url)?.parse({ (result) in
                DispatchQueue.main.async {
                    self.feed = result.rssFeed
                    // Perform updates in the main thread when finished
                    self.tblView?.reloadData()
                }
            })
        }
    }
    
    //MARK: - NavigationBar Button Methods
    
    func setLeftSideNavBarButton() {
        
        let btnLeftInfo:UIBarButtonItem = UIBarButtonItem(image: UIImage(named:"Info")!, style: .plain, target: self, action: #selector(onPressInfoButtonLeftSide))

        self.navigationItem.leftBarButtonItem = btnLeftInfo
    }
    
    func onPressInfoButtonLeftSide() {

        let alertMessage:String = "This app uses Apple's Developer News RSS Feeds(https://developer.apple.com/news/rss/news.rss) to display data.\n\nCredits:\nFeedKit - https://github.com/nmdias/FeedKit\nImages - https://icons8.com\nImages - https://flaticon.com \n\nPlease report any issues you find, as this app is designed to demonstrate the use of Swift and its API to parse RSS feeds."
        
        
        let alertInfo:UIAlertController = UIAlertController(title: "About", message: alertMessage, preferredStyle: .alert)

        alertInfo.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertInfo, animated: true)
    }
    
    //MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feed?.items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedViewCell") as! FeedViewCell

        cell.lblTitle?.text = self.feed?.items?[indexPath.row].title
        cell.lblDesc?.text = self.feed?.items?[indexPath.row].description

        return cell
    }
}

extension ListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vcFeedDetail = storyboard?.instantiateViewController(withIdentifier: "FeedDetailViewController") as! FeedDetailViewController

        vcFeedDetail.feedItem = self.feed?.items?[indexPath.row]

        navigationController?.pushViewController(vcFeedDetail, animated: true)
    }
}
