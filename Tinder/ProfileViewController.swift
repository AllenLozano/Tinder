//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Allen Lozano on 11/23/18.
//  Copyright © 2018 Allen Lozano. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var picImageView: UIImageView!
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         picImageView.image = profileImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.performSegue(withIdentifier: "returnSegue", sender: nil)
    }
}
