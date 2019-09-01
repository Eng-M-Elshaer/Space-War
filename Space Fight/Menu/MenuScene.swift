//
//  MenuScene.swift
//  Space Fight
//
//  Created by Mohamed Elshaer on 8/29/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {

    var startField:SKEmitterNode!
    var newGameBtn:SKSpriteNode!
    var diffcultyBtn:SKSpriteNode!
    var diffultyLabel:SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        startField = self.childNode(withName: "startfield") as? SKEmitterNode
        startField.advanceSimulationTime(10)
        newGameBtn = self.childNode(withName: "newGameBtn") as? SKSpriteNode
        diffcultyBtn = self.childNode(withName: "diffclutyBtn") as? SKSpriteNode
        diffultyLabel = self.childNode(withName: "diffcuktyLabel") as? SKLabelNode
        let userDefult = UserDefaults.standard
        if userDefult.bool(forKey: "hard") {
            diffultyLabel.text = "Hard"
        } else {
            diffultyLabel.text = "Easy"
        }
    }
    
    func changeDiffcuty(){
       
        let userDefult =  UserDefaults.standard
        
        if diffultyLabel.text == "Easy" {
            diffultyLabel.text = "Hard"
            userDefult.set(true, forKey: "hard")
        }else{
            diffultyLabel.text = "Easy"
            userDefult.set(true, forKey: "hard")
        }
        userDefult.synchronize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let loction = touch?.location(in: self) {
            let nodesArray = self.nodes(at: loction)
            if nodesArray.first?.name == "newGameBtn" {
                print("gggg")
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameSecene = GameScene(size: self.size)
                self.view?.presentScene(gameSecene,transition: transition)
            } else if nodesArray.first?.name == "diffclutyBtn" {
                changeDiffcuty()
            }
        }
    }
}
