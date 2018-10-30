//
//  ViewController.swift
//  Animation1
//
//  Created by Marcelo on 30/10/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private var timer = Timer()
    private var cardQuantity : CGFloat = 24
    
    private var xValue : CGFloat = 0
    private var yValue : CGFloat = 0
    
    private var i : CGFloat = 0
    private var line : CGFloat = 0

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // start timer
        Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    
        
    }
    
    // MARK: - Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    

    // MARK: - Timer
    @objc private func timerTick() {
        addCard()
    }
    
    private func stopTimer() {
        timer.invalidate()
    }
    
    // MARK: - UI Card Manager
    private func addCard() {
        // get card's dimensions
        let width = self.view.bounds.width / cardQuantity
        let rect = CGRect(x: xValue, y: yValue, width: width, height: width)
        let card = UIView(frame: rect)
        
        card.backgroundColor = UIColor.randomColort()
        card.layer.cornerRadius = width / 2.00
        card.layer.masksToBounds = true
        
        self.view.addSubview(card)
        
        if i == cardQuantity - 1 {
            i = -1
            xValue = 0
            yValue += width
            line += 1
        }else{
            xValue += width
        }
        
        if (self.view.bounds.height / width) >= line {
            self.timer.invalidate()
        }
        
        i += 1
        
    }
    
}

extension UIColor {
    class func randomColort() -> UIColor{
        let redValue = CGFloat.random(in: 0 ... 1)
        let greenValue = CGFloat.random(in: 0 ... 1)
        let blueValue = CGFloat.random(in: 0 ... 1)
        
        return UIColor(red: redValue, green: greenValue ,blue: blueValue , alpha:1.00)
    }
}

