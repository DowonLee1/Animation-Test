//
//  ViewController.swift
//  Tree of life church app
//
//  Created by Dowon Lee on 2017. 11. 9..
//  Copyright © 2017년 Dowon Lee. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIScrollViewDelegate {
   
    @IBOutlet var mainView: UIView!
    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var stack: UIStackView!
    @IBOutlet var cell1: UIView!
    @IBOutlet var cell2: UIView!
    @IBOutlet var cell3: UIView!
    @IBOutlet var scrollPage: UIPageControl!
    @IBOutlet var blur: UIVisualEffectView!
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var liveButton: UIButton!
    @IBOutlet var chinese: UIButton!
    @IBOutlet var english: UIButton!
    @IBOutlet var indonesian: UIButton!
    @IBOutlet var korean: UIButton!
    @IBOutlet var spanish: UIButton!
    @IBOutlet var special: UIButton!
    

    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIImageView!
    @IBOutlet var view3: UIImageView!
    
    
    
    var effect: UIVisualEffect!
    
    let notification = UINotificationFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = blur.effect
        blur.effect = nil
        blur.alpha = 0
       
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        cell1.frame.size.height = screenHeight
        cell2.frame.size.height = screenHeight
        cell3.frame.size.height = screenHeight
        print("Screen width = \(screenWidth), screen height = \(screenHeight)")
        scroll.contentSize.height = cell1.frame.size.height * 3
        scroll.contentSize.width = screenWidth
        
        stack.frame.size.width = screenWidth
        stack.frame.size.height = cell1.frame.size.height * 3
        
        view1.layer.cornerRadius = view.frame.width/23.0
        view1.clipsToBounds = true
        view2.layer.cornerRadius = view.frame.width/26.0
        view2.clipsToBounds = true
        view3.layer.cornerRadius = view.frame.width/26.0
        view3.clipsToBounds = true
        
        //scroll.setContentOffset(CGPoint(x: 0, y: 5), animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scroll.contentOffset.x / scroll.frame.size.width
        scrollPage.currentPage = Int(page)
    }

    @IBAction func liveButtonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0, animations: {
            self.backButton.alpha = 1
            self.blur.alpha = 1
            self.navigationItem.leftBarButtonItem?.isEnabled = false
            self.backButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.chinese.alpha = 0
            self.english.alpha = 0
            self.indonesian.alpha = 0
            self.korean.alpha = 0
            self.spanish.alpha = 0
            self.special.alpha = 0
            self.chinese.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.english.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.indonesian.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.korean.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.spanish.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.special.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            //AudioServicesPlaySystemSound(1519) // Actuate `Pop` feedback (strong boom)
            //notification.notificationOccurred(.success)
            //notification.notificationOccurred(.warning)
            self.notification.notificationOccurred(.error)
        })
        
        UIView.animate(withDuration: 0.8, animations: {
            self.liveButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.backButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.scroll.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.blur.effect = self.effect
            //self.cover.alpha = 1
            self.liveButton.alpha = 0
            //self.navigationController?.isNavigationBarHidden = true
            self.backButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            
            //self.view1.layer.cornerRadius = self.view.frame.width/26.0
            //self.view1.clipsToBounds = true
            //self.view2.layer.cornerRadius = self.view.frame.width/26.0
            //self.view2.clipsToBounds = true
            //self.view3.layer.cornerRadius = self.view.frame.width/26.0
            //self.view3.clipsToBounds = true
            
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.7 ,animations: {
            self.chinese.alpha = 1
            self.chinese.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        UIView.animate(withDuration: 0.5, delay: 0.7 ,animations: {
            self.english.alpha = 1
            self.english.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        UIView.animate(withDuration: 0.7, delay: 0.7 ,animations: {
            self.indonesian.alpha = 1
            self.indonesian.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        UIView.animate(withDuration: 0.8, delay: 0.7 ,animations: {
            self.korean.alpha = 1
            self.korean.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        UIView.animate(withDuration: 0.9, delay: 0.7 ,animations: {
            self.spanish.alpha = 1
            self.spanish.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        UIView.animate(withDuration: 1.0, delay: 0.7 ,animations: {
            self.special.alpha = 1
            self.special.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8,delay: 0.6 ,animations: {
            self.liveButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.scroll.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.blur.effect = nil
            self.blur.alpha = 0
            //self.cover.alpha = 0
            self.liveButton.alpha = 1
            //self.navigationController?.isNavigationBarHidden = false
            // self.backButton.alpha = 0
            //AudioServicesPlaySystemSound(1519) // Actuate `Pop` feedback (strong boom)
            self.notification.notificationOccurred(.error)
            
            //self.view1.layer.cornerRadius = self.view.frame.width
            //self.view1.clipsToBounds = true
            //self.view2.layer.cornerRadius = self.view.frame.width
            //self.view2.clipsToBounds = true
            //self.view3.layer.cornerRadius = self.view.frame.width
            //self.view3.clipsToBounds = true
        })
        
        
        
        UIView.animate(withDuration: 0.8, animations: {
            self.chinese.alpha = 0
            self.chinese.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.backButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.backButton.alpha = 0
        })
        UIView.animate(withDuration: 0.7, animations: {
            self.english.alpha = 0
            self.english.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
        UIView.animate(withDuration: 0.6, animations: {
            self.indonesian.alpha = 0
            self.indonesian.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
        UIView.animate(withDuration: 0.5, animations: {
            self.korean.alpha = 0
            self.korean.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
        UIView.animate(withDuration: 0.4, animations: {
            self.spanish.alpha = 0
            self.spanish.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.special.alpha = 0
            self.special.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
        
    }
    
}

