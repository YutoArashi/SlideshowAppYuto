//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Sho Katsukawa on 2016/12/09.
//  Copyright © 2016年 yuuto.arashi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
