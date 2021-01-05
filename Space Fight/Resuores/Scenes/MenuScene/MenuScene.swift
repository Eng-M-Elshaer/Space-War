//
//  MenuScene.swift
//  Space Fight
//
//  Created by Mohamed Elshaer on 8/29/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import SpriteKit

enum Diffulty: String {
    case hard = "Hard"
    case easy = "Easy"

}

class MenuScene: SKScene {
    
    //MARK:- Properties
    var startField: SKEmitterNode!
    var newGameBtn: SKSpriteNode!
    var diffcultyBtn: SKSpriteNode!
    var diffultyLabel: SKLabelNode!
    
    //MARK:- Game Methods
    override func didMove(to view: SKView) {
        didSpaceShipMove()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didTouch(touches)
    }
}

//MARK:- Private Methods
extension MenuScene {
    private func changeDiffcuty(){
        let userDefult =  UserDefaults.standard
        if diffultyLabel.text == Diffulty.easy.rawValue {
            diffultyLabel.text = Diffulty.hard.rawValue
            userDefult.set(true, forKey: "hard")
        }else{
            diffultyLabel.text = Diffulty.easy.rawValue
            userDefult.set(true, forKey: "hard")
        }
        userDefult.synchronize()
    }
    private func didSpaceShipMove(){
        startField = self.childNode(withName: GameUI.startfield) as? SKEmitterNode
        startField.advanceSimulationTime(10)
        newGameBtn = self.childNode(withName: GameUI.newGameBtn) as? SKSpriteNode
        diffcultyBtn = self.childNode(withName: GameUI.diffclutyBtn) as? SKSpriteNode
        diffultyLabel = self.childNode(withName: GameUI.diffcuktyLabel) as? SKLabelNode
        let userDefult = UserDefaults.standard
        if userDefult.bool(forKey: "hard") {
            diffultyLabel.text = Diffulty.hard.rawValue
        } else {
            diffultyLabel.text = Diffulty.easy.rawValue
        }
    }
    private func didTouch(_ touches: Set<UITouch>){
        let touch = touches.first
        if let loction = touch?.location(in: self) {
            let nodesArray = self.nodes(at: loction)
            if nodesArray.first?.name == GameUI.newGameBtn {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameSecene = GameScene(size: self.size)
                self.view?.presentScene(gameSecene,transition: transition)
            } else if nodesArray.first?.name == GameUI.diffclutyBtn {
                changeDiffcuty()
            }
        }
    }
}
