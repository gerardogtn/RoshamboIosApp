//
//  ViewController.swift
//  RoshamboIosApp
//
//  Created by Gerardo Teruel on 5/29/16.
//  Copyright © 2016 Gerardo Teruel. All rights reserved.
//

import UIKit

class MakeSelectionViewController: UIViewController {

  var gameResult : GameOutcome!
  let textOptions = [GameOutcome.Win: "You win!", GameOutcome.Loose: "You lose!", GameOutcome.Tie:  "You tied!"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func generateComputerSelection() -> GameSelection {
    let r = arc4random() % 3
    return GameSelection(rawValue: Int(r))!
  }
  
  
  // Function to be executed when a user clicks on rock. It goes to ResultViewController
  // all programatically
  @IBAction func onRockClick() {
    switch generateComputerSelection() {
    case .Rock:
      gameResult = .Tie
      goToTie()
    case .Paper:
      gameResult = .Win
      goToPaperBeatsRock()
    case .Scissors:
      gameResult = .Loose
      goToRockBeatsScissors()
    }
  }

  
  func goToTie() {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
    
    controller.textToDisplay = textOptions[gameResult]!
    controller.imageName = "itsATie"
    presentViewController(controller, animated: true, completion: nil)
  }
  
  func goToPaperBeatsRock() {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
    
    controller.textToDisplay = textOptions[gameResult]!
    controller.imageName = "PaperCoversRock"
    presentViewController(controller, animated: true, completion: nil)
  }
  
  func goToRockBeatsScissors() {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
    
    controller.textToDisplay = textOptions[gameResult]!
    controller.imageName = "RockCrushesScissors"
    presentViewController(controller, animated: true, completion: nil)
  }
  
  func goToScissorsBeatsPaper() {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
    
    controller.textToDisplay = textOptions[gameResult]!
    controller.imageName = "ScissorsCutPaper"
    presentViewController(controller, animated: true, completion: nil)
  }

}

