//
//  GameScene.swift
//  MiniSpaceJourney Extension
//
//  Created by Daniil Popov on 6/15/19.
//  Copyright © 2019 Daniil Popov. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var Fullnesskey: String = "Fullness";
    var Happinesskey: String = "Happiness";
    
    private var spinnyNode : SKShapeNode?
    
//    var gameplayTimer:Timer?
//    var spawnAlienTimer:Timer?
//    var spawnTorpedoTimer:Timer?
    
    // just CGFloat null, no magic numbers
    var cgNull:CGFloat = 0.0;
    
//    var alienSpeed:TimeInterval = 6;
//    var spawnAliensSpeed:TimeInterval  = 1.0;
//    var spawnTorpedoSpeed:TimeInterval = 0.8;
//
//    var alienTimer: Timer?
//    var torpedoTimer: Timer?
    // Happy
    var Happy:SKLabelNode!
    var happy:Int = 0 {
        didSet {
            Happy.text = "😀 \(happy)";
        }
    }
    // Full
    var Full:SKLabelNode!
    var full:Int = 0 {
        didSet {
            Full.text = "🍽 : \(full)";
        }
    }
    // score
    var scoreLabel:SKLabelNode!
    var score:Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)";
        }
    }
    // emotion
    var emotion:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "happy"))
    
    // spaceship
    var spaceship:SKSpriteNode = SKSpriteNode(imageNamed: "shuttle");
    // aliens
//    var possibleAliens = ["alien", "alien2", "alien3"];
    
    // each object has own category for collisions
    let spaceshipCategory:UInt32     = 0x1 << 2;
//    let alienCategory:UInt32         = 0x1 << 1;
    let photonTorpedoCategory:UInt32 = 0x1 << 0;
    
    override func sceneDidLoad() {
        // assign few properties to objects from GameScene
        for node in self.children {
            if (node.name == "spaceship") {
                if let ship:SKSpriteNode = node as? SKSpriteNode {
                    spaceship = ship;
                    spaceship.zPosition = 1;
                    
//                    spaceship.physicsBody?.categoryBitMask    = spaceshipCategory;
//                    spaceship.physicsBody?.contactTestBitMask = alienCategory;
//                    spaceship.physicsBody?.collisionBitMask   = 0;
                }
            }
            
            if(node.name == "emotion") {
                if let emozi:SKSpriteNode = node as? SKSpriteNode {
                    emotion = emozi;
                    emotion.zPosition = 1;
                    if happy > 7 {
                        emotion.texture = SKTexture(imageNamed: "happy")
                    }
                    else if happy < 7 && happy>=4 {
                        emotion.texture = SKTexture(imageNamed: "soso")
                    }
                    else if happy < 4 {
                        emotion.texture = SKTexture(imageNamed: "angry")
                    }
                    
                }
            }
            
            if (node.name == "scoreLabel") {
                if let scoreLab:SKLabelNode = node as? SKLabelNode {
                    scoreLabel           = scoreLab;
                    scoreLabel.text      = "Score: 0";
                    scoreLabel.fontName  = "Helvetica-Bold";
                    scoreLabel.fontSize  = 26;
                    scoreLabel.zPosition = 1;
                    score = 0;
                }
            }
            if (node.name == "Happy") {
                if let happyLab:SKLabelNode = node as? SKLabelNode {
                    Happy                = happyLab;
                    Happy.text           = "Happy :) 0";
                    Happy.fontName       = "Helvetica-Bold";
                    Happy.fontSize       = 26;
                    Happy.zPosition      = 1;
                    happy = 7;
                }
            }
            if (node.name == "Full") {
                if let fullLab:SKLabelNode = node as? SKLabelNode {
                    Full                 = fullLab;
                    Full.text            = "Full: 0";
                    Full.fontName        = "Helvetica-Bold";
                    Full.fontSize        = 26;
                    Full.zPosition       = 1;
                    full = 5;
                }
            }

        }
        
    func updateFull(full: Int) -> Void {
        let defaults = UserDefaults.standard
        let fullness = defaults.integer(forKey: self.Fullnesskey)
        if (fullness != full) {
            defaults.set(full, forKey: self.Fullnesskey)
        }
    }
    func updateHappy(happy: Int) -> Void {
        let defaults = UserDefaults.standard
        let fullness = defaults.integer(forKey: self.Happinesskey)
        if (fullness != happy) {
            defaults.set(happy, forKey: self.Happinesskey)
        }
    }
    
        
        
//        self.physicsWorld.gravity         = CGVector( dx: 0, dy: 0);
//        self.physicsWorld.contactDelegate = self;
//
//        setTimers()
    }
    
//    func setTimers() {
//        // speedup gameplay
//        gameplayTimer   = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(accelerateGameplay), userInfo: nil, repeats: true)
//        // spawns alien
//        spawnAlienTimer = Timer.scheduledTimer(timeInterval: spawnAliensSpeed, target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
//        // fire torpedos
//        spawnTorpedoTimer = Timer.scheduledTimer(timeInterval: spawnTorpedoSpeed, target: self, selector: #selector(fireTorpedo), userInfo: nil, repeats: true)
//    }
//
//    @objc func accelerateGameplay() {
//        if (alienSpeed >= 4) {
//            alienSpeed -= 0.2
//        }
//
//        if (spawnAliensSpeed >= 0.1) {
//            spawnAliensSpeed -= 0.1
//        }
//
//        if (spawnTorpedoSpeed >= 0.01) {
//            spawnTorpedoSpeed -= 0.1
//        }
//    }
//
//    func stopTimers() {
//        gameplayTimer?.invalidate()
//        spawnAlienTimer?.invalidate()
//        spawnTorpedoTimer?.invalidate()
//    }
//    
//    func resetGameplay() {
//        alienSpeed        = 6;
//        spawnAliensSpeed  = 1.0;
//        spawnTorpedoSpeed = 0.8;
//    }
//    
//    @objc func addAlien() {
//        let possibleAlien = possibleAliens.randomElement()!;
//        let alien         = SKSpriteNode(imageNamed: possibleAlien);
//        let randomX       = Int.random(in: -Int(self.frame.size.width / 2 - alien.size.width) ..< Int(self.frame.size.width / 2 - alien.size.width));
//
//        alien.position    = CGPoint(x: CGFloat(randomX), y: self.frame.size.height / 2 - alien.size.height);
//
//        alien.physicsBody            = SKPhysicsBody(rectangleOf: alien.size);
//        alien.physicsBody?.isDynamic = true;
//
//        alien.physicsBody?.categoryBitMask    = alienCategory;
//        alien.physicsBody?.contactTestBitMask = photonTorpedoCategory | spaceshipCategory;
//        alien.physicsBody?.collisionBitMask   = 0;
//        
//        self.addChild(alien);
//        
//        let animationDuration:TimeInterval = alienSpeed;
//        var actionArray = [SKAction]();
//        
//        var movingToPosition:CGPoint = CGPoint(x: alien.position.x, y: -self.frame.height)
//        if (Int.random(in: 0...10) % 3 == 0 && score >= 50 ) {
//            movingToPosition = CGPoint(x: spaceship.position.x, y: -self.frame.height)
//        }
//        
//        actionArray.append(SKAction.move(to: movingToPosition, duration: animationDuration));
//        actionArray.append(SKAction.removeFromParent());
//        
//        alien.run(SKAction.sequence(actionArray));
//    }
//    
//    @objc func fireTorpedo() {
//        let torpedoNode = SKSpriteNode(imageNamed: "torpedo");
//        torpedoNode.position    = spaceship.position;
//        torpedoNode.position.y += 5;
//        
//        torpedoNode.physicsBody            = SKPhysicsBody(circleOfRadius: torpedoNode.size.width / 2);
//        torpedoNode.physicsBody?.isDynamic = true;
//        
//        torpedoNode.physicsBody?.categoryBitMask    = photonTorpedoCategory;
//        torpedoNode.physicsBody?.contactTestBitMask = alienCategory;
//        torpedoNode.physicsBody?.collisionBitMask   = 0;
//
//        torpedoNode.physicsBody?.usesPreciseCollisionDetection = true;
//        
//        self.addChild(torpedoNode);
//        
//        let animationDuration:TimeInterval = 0.3;
//        
//        var actionArray = [SKAction]();
//        
//        actionArray.append(SKAction.move(to: CGPoint(x: spaceship.position.x, y: self.frame.height + 10), duration: animationDuration));
//        actionArray.append(SKAction.removeFromParent());
//        
//        torpedoNode.run(SKAction.sequence(actionArray));
//    }
//    
    func moveSpaceshipBy(amountX:CGFloat, amountY:CGFloat) {
        
//        if (amountX >= 2 || amountX <= -2) {
//            if (self.scene?.isPaused == true) {
//                unpause()
//            }
//        }
        
        let move:SKAction = SKAction.moveBy(x: 5 * amountX, y: amountY, duration: 0);
        move.timingMode   = .easeOut;
        
        // check the boarders and movement direction
        if (-self.frame.size.width / 2 < spaceship.position.x - spaceship.size.width && amountX < cgNull) {
            spaceship.run (move);
        }
        
        if (spaceship.position.x < self.frame.size.width / 2 - spaceship.size.width && amountX > cgNull) {
            spaceship.run (move);
        }
    }
//    
//    func didBegin(_ contact: SKPhysicsContact) {
//        var firstBody:SKPhysicsBody;
//        var secondBody:SKPhysicsBody;
//        
//        if contact.bodyA.categoryBitMask < contact.bodyB.collisionBitMask {
//            firstBody  = contact.bodyA;
//            secondBody = contact.bodyB;
//        } else {
//            firstBody  = contact.bodyB;
//            secondBody = contact.bodyA;
//        }
//        
//        if (firstBody.categoryBitMask & photonTorpedoCategory) != 0
//            && (secondBody.categoryBitMask & alienCategory) != 0 {
//            torpedoCollideWithAlien(torpedoNode: firstBody.node as! SKSpriteNode, alienNode: secondBody.node as! SKSpriteNode);
//        }
//        
//        if  (firstBody.categoryBitMask & alienCategory) != 0
//            && (secondBody.categoryBitMask & spaceshipCategory) != 0 {
//            alienCollidedWithSpaceship(alienNode: firstBody.node as! SKSpriteNode, spaceshipNode: secondBody.node as! SKSpriteNode);
//        }
//    }
//    
//    func torpedoCollideWithAlien( torpedoNode:SKSpriteNode, alienNode:SKSpriteNode) {
//        // add explosion
//        let explosion = SKSpriteNode(fileNamed: "explosion")!;
//        
//        explosion.size     = CGSize(width: 5, height: 5);
//        explosion.position = alienNode.position;
//        
//        self.addChild(explosion);
//        
//        torpedoNode.removeFromParent();
//        alienNode.removeFromParent();
//        
//        self.run(SKAction.wait(forDuration: 0.1)) {
//            explosion.removeFromParent();
//        }
//        
//        score += 1;
//    }
//    
//    func alienCollidedWithSpaceship( alienNode:SKSpriteNode, spaceshipNode:SKSpriteNode) {
//        alienNode.removeFromParent();
//
//        // add explosion
//        let explosion = SKSpriteNode(fileNamed: "explosion")!;
//        
//        explosion.size     = CGSize(width: 5, height: 5);
//        explosion.position = spaceshipNode.position;
//        
//        self.addChild(explosion);
//        
//        self.run(SKAction.wait(forDuration: 0.3)) {
//            explosion.removeFromParent();
//        }
//        
//        self.updateHighestScore(score: self.score);
//        
//        // @todo: Better pause handling
//        pause();
//        
//        score = 0;
//    }
//    
//    public func pause() {
//        stopTimers()
//        
//        if (self.scene?.isPaused == false) {
//            self.scene?.isPaused = true
//        }
//    }
//    
//    public func unpause() {
//        if (self.scene?.isPaused == true) {
//            self.scene?.isPaused = false
//            resetGameplay()
//            setTimers()
//        }
//    }
    

//    
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }
//
}
