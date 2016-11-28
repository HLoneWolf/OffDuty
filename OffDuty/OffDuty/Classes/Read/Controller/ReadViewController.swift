//
//  ReadViewController.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/17.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

private let cellID = "readCellId"
private let cellHeadID = "readCellHeadId"
private let cellMargin:CGFloat = 8.0
private let cellWH = (kScreenW-3*cellMargin)/2
private let headViewH:CGFloat = 300
private let topCollectionViewH: CGFloat = 200
private let topItemCollectionViewH: CGFloat = headViewH - topCollectionViewH
private let topCellID = "topCellId"
private let topCellHeadID = "readHeadCell"
private let threeCell = "threeCellId"

class ReadViewController: UIViewController {

    
    lazy var collectView: UICollectionView = { [weak self] in
        
        let flayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: flayout)
        
        flayout.itemSize = CGSize(width:cellWH, height: cellWH)
        flayout.minimumLineSpacing = cellMargin
        flayout.minimumInteritemSpacing = cellMargin
        flayout.sectionInset = UIEdgeInsets(top: 0, left: cellMargin, bottom: 0, right: cellMargin)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        cv.register(UINib(nibName: "CellHeadView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeadID)
        cv.register(UINib(nibName: "ContentCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        return cv
    }()
    
    
    lazy var headView: UIView = { [weak self] in
        let head = UIView(frame: CGRect(x: 0, y: -headViewH, width: kScreenW, height: headViewH))
        head.backgroundColor = UIColor.white
        return head
        
    }()
    

    lazy var headCollocView: UICollectionView = { [weak self] in
        let flayout = UICollectionViewFlowLayout()
        flayout.itemSize = CGSize(width:kScreenW, height: topCollectionViewH)
        flayout.scrollDirection = .horizontal
        flayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flayout.minimumLineSpacing = 0
        let clv = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: topCollectionViewH), collectionViewLayout: flayout)
        clv.backgroundColor = UIColor.red
        clv.delegate = self
        clv.dataSource = self
        clv.bounces = false
        clv.register(UINib(nibName: "HeadTopCell", bundle: nil), forCellWithReuseIdentifier: topCellID)
        clv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: topCellHeadID)
        return clv
    }()
    
    lazy var threeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let itemSizeH = topItemCollectionViewH * 0.8
        let itemSizeW = topItemCollectionViewH * 1.25
        layout.itemSize = CGSize(width: itemSizeW, height: itemSizeH)
        layout.minimumInteritemSpacing = cellMargin
        layout.minimumLineSpacing = cellMargin
        layout.sectionInset = UIEdgeInsets(top: 0, left: cellMargin, bottom: 0, right: cellMargin)
        layout.scrollDirection = .horizontal
        let clv = UICollectionView(frame: CGRect(x: 0, y: topCollectionViewH, width: kScreenW, height: topItemCollectionViewH), collectionViewLayout: layout)
        clv.backgroundColor = UIColor.yellow
//        clv.showsVerticalScrollIndicator = false
        clv.showsHorizontalScrollIndicator = false
        clv.delegate = self
        clv.dataSource = self
        clv.register(UINib(nibName: "NextHeadCell", bundle: nil), forCellWithReuseIdentifier: threeCell)
        clv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: topCellHeadID)
        return clv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviBar()
        setUI()
        
    }

}


extension ReadViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
      
        if collectionView == headCollocView || collectionView == threeCollectionView{
            return CGSize.zero
        }
        return CGSize(width: kScreenW, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        var headView = UICollectionReusableView()
        //|| collectionView == threeCollectionView
        if collectionView == headCollocView {
            headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: topCellHeadID, for: indexPath)
//            headView = nil
        }else if collectionView == threeCollectionView{
            headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: threeCell, for: indexPath)
        }else{
            headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeadID, for: indexPath)
        }
        return headView
       
    }
}

extension ReadViewController: UICollectionViewDataSource{
    
    
    
}

extension ReadViewController: UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == headCollocView || collectionView == threeCollectionView{
            return 1
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headCollocView || collectionView == threeCollectionView{
            return 5
        }
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell
        if collectionView == headCollocView{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellID , for: indexPath)
        }else if collectionView == threeCollectionView{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: threeCell, for: indexPath)
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        }
        
        return cell

    }
    
}


extension ReadViewController {
    
    
    func setUI() {
        // 添加collectionView
        view.addSubview(collectView)
        
        collectView.contentInset = UIEdgeInsets(top: headViewH, left: 0, bottom: 0, right: 0)
        
        headView.addSubview(headCollocView)
        headView.addSubview(threeCollectionView)
        collectView.addSubview(headView)
        
    }
    func setNaviBar() {
        
        navigationItem.title = "不上班"
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navibar"), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: KMainColor,NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18.0)]
        
        // 右边的播放按钮
        let leftBar = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftBar.backgroundColor = UIColor.red
        leftBar.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBar)
        
    }
    
    func btnClick() {
        print("click")
        let vc = TestCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
