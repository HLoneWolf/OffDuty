//
//  SettingViewController.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/28.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        let navbView = Bundle.main.loadNibNamed("NavigationBarView", owner: self, options: nil)?.last as! NaviBarView
//            navbView.backgroundColor = UIColor.red
        //        navbView.alpha = 0.2
        
        navbView.backBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(navbView)
        tableView.separatorColor = UIColor.red
        tableView.separatorInset = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: -10)
    }
    func btnClick() {
        print("click")
        navigationController?.popViewController(animated: true)
    }

}

extension SettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1:4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")
//        if indexPath.section == 0 {
//            cell?.backgroundColor = UIColor.red
//        }else{
//            if indexPath.row % 2 == 0 {
//                cell?.backgroundColor = UIColor.orange
//            }else{
//                cell?.backgroundColor = UIColor.yellow
//            }
//        }
        cell?.separatorInset = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: -10)
//        cell?.layoutMargins = UIEdgeInsets.zero
        return cell!
        
    }
    
    
}
extension SettingViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 80:44
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return CGFLOAT_MIN
//    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    
}

