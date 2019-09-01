//
//  MenuScene.swift
//  Space Fight
//
//  Created by Mohamed Elshaer on 8/29/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {

    var gameOverBtn:SKSpriteNode!
    var scoreLabel:SKLabelNode!
    
    var score:Int = 0
    
    override func didMove(to view: SKView) {
        
        scoreLableSetup()
        
    }
    
    
    func scoreLableSetup(){
        
        scoreLabel = self.childNode(withName: "scoreLabel") as? SKLabelNode

        scoreLabel.text = "\(score)"
        
        gameOverBtn = self.childNode(withName: "gameOverBtn") as? SKSpriteNode
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let loction = touch?.location(in: self) {
            let nodesArray = self.nodes(at: loction)
            if nodesArray[0].name == "gameOverBtn" {
                let transation = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameSence = GameScene(size: self.size)
                self.view?.presentScene(gameSence,transition: transation)
            }
        }
    }
}
