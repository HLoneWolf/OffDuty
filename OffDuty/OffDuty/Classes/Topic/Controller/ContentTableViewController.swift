//
//  ContentTableViewController.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/28.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

class ContentTableViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        let navbView = Bundle.main.loadNibNamed("NavigationBarView", owner: self, options: nil)?.last as! NaviBarView
//        navbView.backgroundColor = UIColor.black
//        navbView.alpha = 0.2
    
        navbView.backBtn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        view.addSubview(navbView)
    
    }


}

extension ContentTableViewController: UITableViewDataSource{
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicContentCell", for: indexPath)
        
        // Configure the cell...
        return cell
    }
    
}

extension ContentTableViewController {
    func backClick(){
        
        navigationController?.popViewController(animated: true)
    }
}
