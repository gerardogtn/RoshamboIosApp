//
//  ViewController.swift
//  RoshamboIosApp
//
//  Created by Gerardo Teruel on 5/29/16.
//  Copyright © 2016 Gerardo Teruel. All rights reserved.
//

import UIKit

class MakeSelectionViewController: UIViewController {

  let textOptions = [GameOutcome.Win: "You win!", GameOutcome.Loose: "You lose!", GameOutcome.Tie:  "You tied!"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // Function to be executed when a user clicks on rock. It goes to ResultViewController
  // all programatically
  @IBAction func onRockClick() {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
    let computerChoice = GameSelection.generateRandom()
    let result = GameSelection.Rock.result(computerChoice)
    
    controller.textToDisplay = textOptions[result!.0]!
    controller.imageName = result!.1
    presentViewController(controller, animated: true, completion: nil)
  }
  
  @IBAction func onPaperClick() {
    self.performSegueWithIdentifier("paper", sender: self)
  }

  // REQUIRES: segue.identifier is a GameSelection rawValue.
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let controller = segue.destinationViewController as! ResultViewController
    
    let computerChoice = GameSelection.generateRandom()
    let userChoice = GameSelection(rawValue: segue.identifier!)
    let result: (GameOutcome, String)? = userChoice?.result(computerChoice)
    
    controller.textToDisplay = textOptions[result!.0]!
    controller.imageName = result!.1
  }

}

