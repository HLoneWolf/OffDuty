//
//  TopicViewController.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/28.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController {

    
    @IBOutlet weak var topTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.isHidden = true
        
    }

}


extension TopicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath)
        return cell
    }
    
}

extension TopicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
    }
}

