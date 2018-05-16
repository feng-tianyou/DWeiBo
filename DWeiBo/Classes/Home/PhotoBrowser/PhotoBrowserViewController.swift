//
//  PhotoBrowserViewController.swift
//  DWeiBo
//
//  Created by DaiSuke on 2018/5/16.
//  Copyright © 2018年 DaiSuke. All rights reserved.
//

import UIKit

class PhotoBrowserViewController: UIViewController {

    /// 图片数组
    var imageUrls: [NSURL]?
    /// 用户选中的图片索引
    var currentIndex: Int
    
    init(urls:[NSURL], index:Int) {
        imageUrls = urls
        currentIndex = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupUI()
    }

    func setupUI() {
        view.addSubview(collectionView)
        view.addSubview(closeBtn)
        view.addSubview(saveBtn)
        
        closeBtn.xmg_AlignInner(type: XMG_AlignType.bottomLeft, referView: view, size: CGSize(width: 100, height: 32), offset: CGPoint(x: 8, y: -8))
        saveBtn.xmg_AlignInner(type: XMG_AlignType.bottomRight, referView: view, size: CGSize(width: 100, height: 32), offset: CGPoint(x: 8, y: -8))
        collectionView.frame = UIScreen.main.bounds
        
        saveBtn.addTarget(self, action: #selector(save), for: UIControlEvents.touchUpInside)
        closeBtn.addTarget(self, action: #selector(close), for: UIControlEvents.touchUpInside)
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func save() {
        print("保存图片")
    }
    
    private lazy var closeBtn: UIButton = UIButton(tittle: "关闭", fontSize: 14, color: UIColor.white, backColor: UIColor.darkGray)
    private lazy var saveBtn: UIButton = UIButton(tittle: "保存", fontSize: 14, color: UIColor.white, backColor: UIColor.darkGray)
    private lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
}
