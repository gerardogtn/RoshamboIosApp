//
//  GameSelection.swift
//  RoshamboIosApp
//
//  Created by Gerardo Teruel on 5/29/16.
//  Copyright © 2016 Gerardo Teruel. All rights reserved.
//

import Foundation


enum GameSelection: String {
  case Rock = "rock"
  case Paper = "paper"
  case Scissors = "scissors"
  
  func result(selection: GameSelection) -> (GameOutcome, String)? {
    if self == selection {
      return (.Tie, "itsATie")
    } else if self == .Rock && selection == .Scissors {
      return (.Win, "RockCrushesScissors")
    } else if self == .Paper && selection == .Rock {
      return (.Win, "PaperCoversRock")
    } else if self == .Scissors && selection == .Paper {
      return (.Win, "ScissorsCutPaper")
    } else if selection == .Rock && self == .Scissors {
      return (.Loose, "RockCrushesScissors")
    } else if selection == .Paper && self == .Rock {
      return (.Loose, "PaperCoversRock")
    } else if selection == .Scissors && self == .Paper {
      return (.Loose, "ScissorsCutPaper")
    }
    
    return nil
  }
  
  static func generateRandom() -> GameSelection {
    let r = arc4random() % 3
    if (r == 0) {
      return GameSelection.Rock
    } else if (r == 1) {
      return GameSelection.Paper
    } else {
      return GameSelection.Scissors
    }
  }
}