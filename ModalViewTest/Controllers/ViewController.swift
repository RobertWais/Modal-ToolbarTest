//
//  ViewController.swift
//  ModalViewTest
//
//  Created by Robert Wais on 7/21/18.
//  Copyright © 2018 MakeSchoolHackathon. All rights reserved.
//

import UIKit

protocol confirmDelegate: class {
    func didConfirm(bool: Bool)
}

class ViewController: UIViewController,confirmDelegate {

    @IBOutlet weak var itemConfirm: UIBarButtonItem!
    @IBOutlet weak var itemRemove: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
//    var barbtnItem = UIBarButtonItem(title: "New Button", style: .plain, target: nil, action: nil)
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    var confirmItem: UIBarButtonItem?
    var removeItem: UIBarButtonItem?
    var oldItems = [UIBarButtonItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        toolBar.alpha = 0.0
        updateBarItems()
        
        
        
        ////Confirm Button
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: toolBar.frame.width/2, height: toolBar.frame.height)
        button.addTarget(self, action: #selector(confirmShape), for: UIControlEvents.allTouchEvents)
        button.setTitle("  Confirm  ", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 3.0
        button.layer.masksToBounds = true
        button.sizeToFit()
        confirmItem = UIBarButtonItem(customView: button)
        
        /////Remove Button
        let removeBtn = UIButton(type: .system)
        removeBtn.addTarget(self, action: #selector(pressed), for: UIControlEvents.allTouchEvents)
        removeBtn.setTitle(" Remove ", for: .normal)
        removeBtn.backgroundColor = UIColor.black
        removeBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        removeBtn.layer.borderWidth = 1.0
        removeBtn.layer.borderColor = UIColor.white.cgColor
        removeBtn.layer.cornerRadius = 3.0
        removeBtn.layer.masksToBounds = true
        removeBtn.sizeToFit()
        removeItem = UIBarButtonItem(customView: removeBtn)
        
       
        
       
        
        
//        var barbtnItem = UIBarButtonItem(title: "New Button", style: .plain, target: nil, action: nil)
        
        
//        barbtnItem.tintColor = UIColor.white
        
        
        // Bar title text color
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        let color = UIColor.white
        let titleFont = UIFont(name: "SwitchBack", size: 16.0)
        
        let attributes = [
            NSAttributedStringKey.foregroundColor : color,
            NSAttributedStringKey.shadow : shadow,
            NSAttributedStringKey.font : titleFont
        ]
        
//        self.toolBar.setItems(<#T##items: [UIBarButtonItem]?##[UIBarButtonItem]?#>, animated: <#T##Bool#>)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @objc func confirmShape() {
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "presentPop", sender: self)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let modalVC = storyboard?.instantiateViewController(withIdentifier: "modalVC") as! ModalVC
        modalVC.delegate = self
    }
    
    func didConfirm(bool: Bool){
        fatalError()
        print("This finall worked \(bool)")
    }
    
    @objc func pressed() {
        print("hello world")
        self.toolBar.setItems(oldItems, animated: true)
    }
    
    func updateBarItems(){
        itemRemove.customView?.layer.borderWidth = 3.0
        itemRemove.customView?.layer.borderColor = UIColor.white.cgColor
        toolBar.updateConstraints()
        
    }
    @IBAction func confirmPressed(_ sender: Any) {
        oldItems = self.toolBar.items!
        self.toolBar.setItems([spacer,spacer,spacer,removeItem!,spacer,confirmItem!], animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue){
        print("returning")
        if !oldItems.isEmpty{
            self.toolBar.setItems(oldItems, animated: true)
            toolBar.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.toolBar.alpha = 0.8
            }

        }
        
    }

    @IBAction func removeBtnPressed(_ sender: Any) {
//        UIView.animate(withDuration: 0.8, animations: {
//            self.toolBar.alpha = 0.0
//
//        }) { (completed) in
//            if completed {
//                print("yes")
//                self.toolBar.isHidden = true
//
//            }
//        }
        UIView.animate(withDuration: 0.5) {
            self.toolBar.alpha = 0.0
        }
        
    }
    

    @IBAction func addToolBarPressed(_ sender: Any) {
        print("here")
        self.toolBar.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.toolBar.alpha = 0.8
        }
        
    }
    
}

