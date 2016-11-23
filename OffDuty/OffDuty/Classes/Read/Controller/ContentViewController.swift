//
//  ContentViewController.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/17.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

private let kMargin: CGFloat = 8.0
private let kCellId = "contentCell"
private let glogRate:CGFloat = 0.625
private let originFrame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenW*glogRate)
private let maxOffSetY:CGFloat = 100.0

class ContentViewController: UIViewController  {

    
    lazy var tabView: UITableView = { [weak self] in
        
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)
        let tbView = UITableView(frame: frame, style: .grouped)
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
        tbView.delegate = self
        tbView.dataSource = self
  
        return tbView
    }()

    
    lazy var headView: UIView = { [weak self] in
        
        let view = UIView(frame: originFrame)
        view.backgroundColor = UIColor.yellow
        return view
        }()
    
    
    lazy var backView: UIView = {
        
        let v = UIView(frame: originFrame)
        return v
    }()
    
    lazy var imgView: UIImageView = {
        let img = UIImageView(frame: originFrame)
        img.contentMode = .scaleAspectFill
        img.autoresizesSubviews = true
        img.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        img.clipsToBounds = true
        img.image = UIImage(named: "PersonnelHomePage")
        return img
    }()
    
    lazy var navigationView:UIView = {
        
        let nv = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kNavigationBarH+kStatusBarH))
        
        let btn = UIButton(frame: CGRect(x: kMargin, y: kMargin+kStatusBarH, width: 30, height: 30), normal: "Back", select: "Back")
        nv.addSubview(btn)
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        nv.backgroundColor = UIColor.yellow
        nv.alpha = 0.1
        return nv
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        setUI()
        
//        tabView.tableHeaderView = headView // .plain 显示 width 设置无效 the same as Group
//        tabView.tableHeaderView?.addSubview(headView) // .plain 不显示 the same as Group
        
//        tabView.tableFooterView = v  // .plain 不显示 Group 显示，有Section 边距
//          tabView.tableFooterView?.addSubview(v) // .plain 不显示 the same as Group
//        tabView.scr
//        tabView.tableHeaderView?.addSubview(headView)
//        print(tabView.tableHeaderView!)
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        super.viewWillDisappear(animated)
    }

}

extension ContentViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
   
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: kCellId)!
    
        cell.textLabel?.text = "\(indexPath.row)"

        cell.contentView.backgroundColor = UIColor(2, 2, 2, 1.0)
        return cell
    }
 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
//        print(scrollView.contentOffset.y)
      
        let offsety = scrollView.contentOffset.y

        if offsety < -(maxOffSetY){
            
            print(">maxOffSetY\(offsety)")
//            imgView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

            scrollView.contentOffset.y = -maxOffSetY
            
        }else if offsety<0{
            var rect = originFrame
            rect.origin.y += offsety ;
            rect.size.height -= offsety;
            
            
            let scale = rect.size.height/originFrame.size.height
            print(scale)

//            imgView.transform = CGAffineTransform(scaleX: 2*scale, y: 1.0)
            
            backView.frame = rect;
        }else if offsety<64{
            
            
            // 监听上移 偏移量
            let topMoveRate = offsety/64
            print(topMoveRate)
            
            navigationView.alpha = topMoveRate
//            imgView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

        }else{
            print("不管了")
        }
        

        
    }
    
}

extension ContentViewController{
    
    func setUI(){
        
        backView.addSubview(imgView)
        headView.addSubview(backView)
        tabView.tableHeaderView = headView
        view.addSubview(tabView)
        view.addSubview(navigationView)
        
    }
    
    func btnClick(){
        
        navigationController?.popViewController(animated: true)
    
    }
}

