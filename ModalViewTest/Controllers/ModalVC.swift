//
//  ModalVC.swift
//  ModalViewTest
//
//  Created by Robert Wais on 7/21/18.
//  Copyright © 2018 MakeSchoolHackathon. All rights reserved.
//

import UIKit

class ModalVC: UIViewController {

    weak var delegate: confirmDelegate?
    @IBOutlet weak var boxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxView.layer.cornerRadius = 8
        boxView.layer.borderColor = UIColor.white.cgColor
        
        boxView.layer.borderWidth = 2.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmPressed(_ sender: Any) {
        print("Her")
        if let del = delegate {
            print("yes")
        }
         delegate?.didConfirm(bool: true)
        self.performSegue(withIdentifier: "unwind", sender: self)
    }
    @IBAction func cancelPressed(_ sender: Any) {
        delegate?.didConfirm(bool: false)
        self.performSegue(withIdentifier: "unwind", sender: self)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
