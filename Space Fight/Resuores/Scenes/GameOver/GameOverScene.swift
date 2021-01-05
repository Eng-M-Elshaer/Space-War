//
//  GameOverScene.swift
//  Space Fight
//
//  Created by Mohamed Elshaer on 8/29/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    //MARK:- Properties
    var gameOverBtn: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var score: Int = 0
    
    //MARK:- Game Methods
    override func didMove(to view: SKView) {
        scoreLableSetup()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesBegan(touches)
    }
}

//MARK:- Private Methods
extension GameOverScene {
    private func scoreLableSetup(){
        scoreLabel = self.childNode(withName: GameUI.scoreLabel) as? SKLabelNode
        scoreLabel.text = "\(score)"
        gameOverBtn = self.childNode(withName: GameUI.gameOverBtn) as? SKSpriteNode
    }
    private func touchesBegan(_ touches: Set<UITouch>){
        let touch = touches.first
        if let loction = touch?.location(in: self) {
            let nodesArray = self.nodes(at: loction)
            if nodesArray[0].name == GameUI.gameOverBtn {
                let transation = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameSence = GameScene(size: self.size)
                self.view?.presentScene(gameSence,transition: transation)
            }
        }
    }
}
