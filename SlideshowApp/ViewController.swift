//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 嵐陽一 on 2016/11/29.
//  Copyright © 2016年 yuuto.arashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // TODO: 1. タイマーで写真を自動で変える
    // TODO: 2. イメージビューをタップしたらタップしたイメージを次の画面に表示する
    // TODO: 3. オートレイアウトで画面を整える
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    let imageNameArray = [
        "images.jpg",
        "images-1.jpg",
         ]
    
    var imageIndex = 0
    
    var timer:Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageName = imageNameArray[imageIndex]
        imageView.image = UIImage(named: imageName)
        imageView.isUserInteractionEnabled = true
        imageView.tag = 999
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t: UITouch = touch as! UITouch
            print(t.view?.tag ?? "")
            if t.view?.tag == imageView.tag {
                self.performSegue(withIdentifier: "segueNext", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! NextViewController
        let imageName = imageNameArray[imageIndex]
        next.image = UIImage(named: imageName)!
    }

    @IBAction func pushPlayButton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(self.pushNextButton(_:)),
                userInfo: nil,
                repeats: true)
            timer?.fire()
            
            nextButton.isEnabled = false
            prevButton.isEnabled = false
            
            playButton.setTitle("||", for: UIControlState.normal)
            
        } else {
            timer?.invalidate()
            timer = nil
            
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            
            playButton.setTitle(">", for: UIControlState.normal)
        }
    }
    
    @IBAction func pushNextButton(_ sender: Any) {
        if imageIndex == imageNameArray.count - 1 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        
        let imageName = imageNameArray[imageIndex]
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func pushPrevButton(_ sender: Any) {
        if imageIndex != 0 {
            imageIndex -= 1
        } else {
            imageIndex = imageNameArray.count - 1
        }
        let imageName = imageNameArray[imageIndex]
        imageView.image = UIImage(named: imageName)
    }
}

