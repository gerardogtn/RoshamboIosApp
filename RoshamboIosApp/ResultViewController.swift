//
//  ResultViewController.swift
//  RoshamboIosApp
//
//  Created by Gerardo Teruel on 5/29/16.
//  Copyright © 2016 Gerardo Teruel. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
  
  @IBOutlet var text : UILabel?
  @IBOutlet var image: UIImageView?
  
  var imageName : String = ""
  var textToDisplay : String = ""
  
  override func viewWillAppear(animated: Bool) {
    image?.image = UIImage(named: imageName)
    text?.text = textToDisplay
  }
  
  @IBAction func dismiss() {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
}