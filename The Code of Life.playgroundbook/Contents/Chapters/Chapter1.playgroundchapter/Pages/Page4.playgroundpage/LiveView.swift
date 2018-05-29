import UIKit
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

var intro = SKScene(size: frame.size)
intro.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

class SKButton : SKSpriteNode {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "A"
            {
                let bond = SKSpriteNode(imageNamed: "hydrogenbond.png")
                bond.zRotation = .pi/2
                bond.setScale(0.4)
                bond.position = CGPoint(x: 250, y: touchedNode.position.y)
                scene!.addChild(bond)
                
                let match = SKSpriteNode(imageNamed: "thymine.png")
                match.setScale(0.4)
                match.position = CGPoint(x: 280, y: touchedNode.position.y)
                scene!.addChild(match)
                
                touchedNode.removeFromParent()
            }
            if name == "C" {
                let bond = SKSpriteNode(imageNamed: "hydrogenbond.png")
                bond.zRotation = .pi/2
                bond.setScale(0.4)
                bond.position = CGPoint(x: 250, y: touchedNode.position.y)
                scene!.addChild(bond)
                
                let match = SKSpriteNode(imageNamed: "guanine.png")
                match.setScale(0.4)
                match.position = CGPoint(x: 280, y: touchedNode.position.y)
                scene!.addChild(match)
                
                touchedNode.removeFromParent()
            }
            if name == "G" {
                let bond = SKSpriteNode(imageNamed: "hydrogenbond.png")
                bond.zRotation = .pi/2
                bond.setScale(0.4)
                bond.position = CGPoint(x: 250, y: touchedNode.position.y)
                scene!.addChild(bond)
                
                let match = SKSpriteNode(imageNamed: "cytosine.png")
                match.setScale(0.4)
                match.position = CGPoint(x: 280, y: touchedNode.position.y)
                scene!.addChild(match)
                
                touchedNode.removeFromParent()
            }
            if name == "T" {
                let bond = SKSpriteNode(imageNamed: "hydrogenbond.png")
                bond.zRotation = .pi/2
                bond.setScale(0.4)
                bond.position = CGPoint(x: 250, y: touchedNode.position.y)
                scene!.addChild(bond)
                
                let match = SKSpriteNode(imageNamed: "adenine.png")
                match.setScale(0.4)
                match.position = CGPoint(x: 280, y: touchedNode.position.y)
                scene!.addChild(match)
                
                touchedNode.removeFromParent()
            }
        }
        
    }
}

func buildDNA() {
    let dna = SKSpriteNode(imageNamed: "dna1.png")
    let dna1 = SKTexture(imageNamed: "dna1.png")
    dna.position = midPoint
    dna.setScale(0.5)
    
    let dna2 = SKTexture(imageNamed: "dna2.png")
    //dna2.position = midPoint
    //dna2.setScale(0.5)
    
    let dnaAnimation = [dna1, dna2]
    intro.addChild(dna)
    
    dna.run(SKAction.repeatForever(
        SKAction.animate(with: dnaAnimation, timePerFrame: 0.4)))
}

func buildNucleotides() {
    let adenine = SKSpriteNode(imageNamed: "adenine.png")
    adenine.setScale(0.4)
    adenine.position = CGPoint(x: -50, y: 300)
    scene.addChild(adenine)
    
    let guanine = SKSpriteNode(imageNamed: "guanine.png")
    guanine.setScale(0.4)
    guanine.position = CGPoint(x: -50, y: 250)
    scene.addChild(guanine)
    
    let cytosine = SKSpriteNode(imageNamed: "cytosine.png")
    cytosine.setScale(0.4)
    cytosine.position = CGPoint(x: -50, y: 200)
    scene.addChild(cytosine)
    
    let thymine = SKSpriteNode(imageNamed: "thymine.png")
    thymine.setScale(0.4)
    thymine.position = CGPoint(x: -50, y: 150)
    scene.addChild(thymine)
    
    let cytosine2 = SKSpriteNode(imageNamed: "cytosine.png")
    cytosine2.setScale(0.4)
    cytosine2.position = CGPoint(x: -50, y: 100)
    scene.addChild(cytosine2)
    
    let adenine2 = SKSpriteNode(imageNamed: "adenine.png")
    adenine2.setScale(0.4)
    adenine2.position = CGPoint(x: -50, y: 50)
    scene.addChild(adenine2)
    
    let moveNucleotide = SKAction.moveBy(x: 250, y: 0, duration: 2)
    let moveButton = SKAction.moveBy(x: -220, y: 0, duration: 2)
    
    adenine.run(moveNucleotide)
    thymine.run(moveNucleotide)
    guanine.run(moveNucleotide)
    cytosine.run(moveNucleotide)
    cytosine2.run(moveNucleotide)
    adenine2.run(moveNucleotide)
    
    let aButton = SKButton(imageNamed: "redCircle.png")
    aButton.alpha = 0.5
    aButton.setScale(0.05)
    aButton.name = "A"
    aButton.isUserInteractionEnabled = true
    aButton.position = CGPoint(x: 500, y: 300)
    scene.addChild(aButton)
    
    let gButton = SKButton(imageNamed: "redCircle.png")
    gButton.alpha = 0.5
    gButton.setScale(0.05)
    gButton.name = "G"
    gButton.isUserInteractionEnabled = true
    gButton.position = CGPoint(x: 500, y: 250)
    scene.addChild(gButton)
    
    let cButton = SKButton(imageNamed: "redCircle.png")
    cButton.alpha = 0.5
    cButton.setScale(0.05)
    cButton.name = "C"
    cButton.isUserInteractionEnabled = true
    cButton.position = CGPoint(x: 500, y: 200)
    scene.addChild(cButton)
    
    let tButton = SKButton(imageNamed: "redCircle.png")
    tButton.alpha = 0.5
    tButton.setScale(0.05)
    tButton.name = "T"
    tButton.isUserInteractionEnabled = true
    tButton.position = CGPoint(x: 500, y: 150)
    scene.addChild(tButton)
    
    let cButton2 = SKButton(imageNamed: "redCircle.png")
    cButton2.alpha = 0.5
    cButton2.setScale(0.05)
    cButton2.name = "C"
    cButton2.isUserInteractionEnabled = true
    cButton2.position = CGPoint(x: 500, y: 100)
    scene.addChild(cButton2)
    
    let aButton2 = SKButton(imageNamed: "redCircle.png")
    aButton2.alpha = 0.5
    aButton2.setScale(0.05)
    aButton2.name = "A"
    aButton2.isUserInteractionEnabled = true
    aButton2.position = CGPoint(x: 500, y: 50)
    scene.addChild(aButton2)
    
    aButton.run(moveButton)
    gButton.run(moveButton)
    cButton.run(moveButton)
    tButton.run(moveButton)
    cButton2.run(moveButton)
    aButton2.run(moveButton)
}

func addBubbles(context: SKScene) {
    let emitter = SKEmitterNode()
    emitter.particleLifetime = 40
    emitter.particleBlendMode = SKBlendMode.alpha
    emitter.particleBirthRate = 3
    emitter.particleSize = CGSize(width: 4,height: 4)
    emitter.particleColor = .white
    emitter.position = CGPoint(x:midPoint.x,y:midPoint.y)
    emitter.particleSpeed = 16
    emitter.particleSpeedRange = 100
    emitter.particlePositionRange = CGVector(dx: 0, dy: frame.size.height)
    emitter.emissionAngle = 3.14
    emitter.advanceSimulationTime(40)
    emitter.particleAlpha = 0.5
    emitter.particleAlphaRange = 0.5
    context.addChild(emitter)
}

addBubbles(context: intro)
buildDNA()

let view = SKView(frame: frame)
view.presentScene(intro)
PlaygroundPage.current.liveView = view

addBubbles(context: scene)

let short = SKAction.wait(forDuration: 2.0)
let newScene = SKAction.run {
    let transition = SKTransition.crossFade(withDuration: 1)
    view.presentScene(scene, transition: transition)
}

intro.run(SKAction.sequence([short, newScene]))
buildNucleotides()
