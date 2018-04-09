//
//  ViewController.swift
//  Flip card game
//
//  Created by Rick LIN on 2018/4/9.
//  Copyright © 2018年 Rick LIN. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    let face = [UIImage(named: "01"),UIImage(named: "02"),UIImage(named: "03"),UIImage(named: "04"),UIImage(named: "05"),UIImage(named: "06")]
    var faceChoise = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameInit()
        //print("cardButtons= \(cardButtons[0]) ")
    }

   
    var flipCount: Int = 0{
        didSet{
            flipCountLabel.text = "翻牌次數：\(flipCount)"
        }
    }
    
    
    
    //let numberOfPairsOfCard = cardButtons.count
   
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = cardButtons.index(of: sender){
//            flipCountLabel.text = "\(cardIndex)"
        }
    }
    
   
    @IBOutlet weak var temp: UILabel!
    
    struct Card{
        var backImage: UIImage
        var isFaceUp: Bool
        //let identifier: Int
        init(){
            backImage = UIImage(named: "backcard")!
            isFaceUp = false
        }
    }
    
    func gameInit (){
        //var cards = Array<Card>()
        var cards = [Card]()
        choiseFace()
        
        
        for i in cardButtons.indices {
            //print("\(view)")
            if let btn = cardButtons[i] as? UIButton {
                var card = Card()
                card.backImage = faceChoise[i] as! UIImage
                cards.append(card)
                btn.setImage(faceChoise[i], for: .normal)
            }
        }
      
    }
    
    func choiseFace(){
        let randomOfnums = GKShuffledDistribution(lowestValue: 0, highestValue: face.count - 1)
        let numberOfPairsOfCards = Int(cardButtons.count / 2)
        for _ in 0 ..< numberOfPairsOfCards{
            let index = randomOfnums.nextInt()
            if let faceX = face[index]{
                faceChoise.append(faceX)
                faceChoise.append(faceX)
            }
        }
        faceChoise.shuffle()
    }
    
}

extension Array{
    mutating func shuffle(){
        for _ in 0 ..< self.count {
            sort{(_,_) in arc4random() < arc4random()}
        }
    }
}


