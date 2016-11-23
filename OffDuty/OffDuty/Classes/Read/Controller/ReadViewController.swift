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

class ReadViewController: UIViewController {

    
    lazy var collectionView: UICollectionView = { [weak self] in
        
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviBar()
        setUI()
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//            let vc = ContentViewController()
//            navigationController?.pushViewController(vc, animated: true)
//
    }
 
    

}


extension ReadViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: kScreenW, height: 50)

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeadID, for: indexPath)
        return headView
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
//        
//    }
}

extension ReadViewController: UICollectionViewDataSource{
    
}

extension ReadViewController: UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
        
    }
    
}


extension ReadViewController {
    
    
    func setUI() {
        // 添加collectionView
        view.addSubview(collectionView)
        
        collectionView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        let headView = UIView(frame: CGRect(x: 0, y: -300, width: kScreenW, height: 300))
        headView.backgroundColor = UIColor.red
        collectionView.addSubview(headView)
        
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
//        let flayout = UICollectionViewFlowLayout()
//        flayout.itemSize = CGSize(width:170, height: 170)
//        flayout.minimumLineSpacing = 8
//        flayout.minimumInteritemSpacing = 8
//        flayout.scrollDirection = .horizontal
        let vc = TestCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
