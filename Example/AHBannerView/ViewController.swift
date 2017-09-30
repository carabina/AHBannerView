//
//  ViewController.swift
//  AHBannerView
//
//  Created by Andy Tong on 07/13/2017.
//  Copyright (c) 2017 Andy Tong. All rights reserved.
//

import UIKit
import AHBannerView

class ViewController: UIViewController {
    var bannerView: AHBannerView!
    fileprivate var images: [UIImage] = {
        var imgs = [UIImage]()
        imgs.append(UIImage(named: "01")!)
        imgs.append(UIImage(named: "02")!)
        imgs.append(UIImage(named: "03")!)
        return imgs
    }()
    let placeholder = UIImage(named: "placeholder")
    override func viewDidLoad() {
        super.viewDidLoad()
        let bannerFrame = CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 200.0)
        bannerView = AHBannerView(frame: bannerFrame)
        
        self.view.addSubview(bannerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var isDownloaded = false
        var imgCached: UIImage? = nil
        
        var style = AHBannerStyle()
        style.placeholder = self.placeholder
        style.isAutoSlide = true
//        style.isInfinite = false
//        style.isPagingEnabled = false
        style.timeInterval = 1
        style.showIndicator = true
        style.indicatorColor = UIColor.red
        style.showPageControl = true
        style.bottomHeight = 30
        style.isPageControlSeparated = false
        style.pageControlColor = UIColor.gray
        style.pageControlSelectedColor = UIColor.red
        
        
        bannerView.setup(imageCount: 5, Style: style)
        bannerView.delegate = self
        
        
        
        
        bannerView.didSwitch { (index) in
            //            print("closure -> didSwitch:\(index)")
        }
        bannerView.didTapped { (index) in
            //            print("close -> didTapped:\(index)")
        }
        bannerView.refresh()
    }
    
    
}

extension ViewController: AHBannerViewDelegate {
    func bannerViewForImage(_ bannerView: AHBannerView, imageView: UIImageView, atIndex: Int) {
        // not implementing yet
    }
    func bannerView(_ bannerView: AHBannerView, didSwitch toIndex: Int) {
        //        print("delegate -> didSwitch:\(toIndex)")
    }
    func bannerView(_ bannerView: AHBannerView, didTapped atIndex: Int) {
        //        print("delegate -> didTapped:\(atIndex)")
    }
}

