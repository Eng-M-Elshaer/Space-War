//
//  GameVC.swift
//  Space Fight
//
//  Created by Mohamed Elshaer on 8/29/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameVC: UIViewController {
    
    //MARK:- Game Properties
    override var shouldAutorotate: Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheGame()
    }
    
    //MARK:- Game Methods
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK:- Priavte Methods
extension GameVC {
    private func setupTheGame(){
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: Scenes.menuScene) {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}
