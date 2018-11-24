//
//  ViewController.swift
//  Tinder
//
//  Created by Allen Lozano on 11/23/18.
//  Copyright © 2018 Allen Lozano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsImageView.layer.cornerRadius = 50
        cardsImageView.clipsToBounds = true
        cardsImageView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            cardInitialCenter = sender.location(in: cardsImageView)
        } else if sender.state == .changed {
            if cardInitialCenter.y >= 199 {
                if translation.x < 0 {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = min(45, -Double(translation.x)/4) * Double.pi / 180
                    cardsImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardsImageView.transform = cardsImageView.transform.rotated(by: CGFloat(rotationAmount))
                } else {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = max(-45, -Double(translation.x)/4) * Double.pi / 180
                    cardsImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardsImageView.transform = cardsImageView.transform.rotated(by: CGFloat(rotationAmount))
                }
            } else {
                if translation.x < 0 {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = max(-45, Double(translation.x)/4) * Double.pi / 180
                    cardsImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardsImageView.transform = cardsImageView.transform.rotated(by: CGFloat(rotationAmount))
                } else {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = min(45, Double(translation.x)/4) * Double.pi / 180
                    cardsImageView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardsImageView.transform = cardsImageView.transform.rotated(by: CGFloat(rotationAmount))
                }
            }
        } else if sender.state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.cardsImageView.center.x += 100
                }) { (success) in
                    if success {
                        self.cardsImageView.isHidden = true
                    }
                }
            }
            else if translation.x < -50 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.cardsImageView.center.x -= 100
                }) { (success) in
                    if success {
                        self.cardsImageView.isHidden = true
                    }
                }
                
            }
            else {
                UIView.animate(withDuration: 0.1, animations: {
                    self.cardsImageView.transform = CGAffineTransform.identity
                }) { (success) in
                    if success {
                        self.cardsImageView.isHidden = false
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ProfileViewController
        vc.profileImage = cardsImageView.image
    }
    
}

