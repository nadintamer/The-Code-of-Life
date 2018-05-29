import UIKit
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

func buildNucleotides() {
    let adenine = SKSpriteNode(imageNamed: "adenine.png")
    adenine.setScale(0.7)
    adenine.position = CGPoint(x: 70, y: -50)
    scene.addChild(adenine)
    
    let guanine = SKSpriteNode(imageNamed: "guanine.png")
    guanine.setScale(0.7)
    guanine.position = CGPoint(x: 185, y: -50)
    scene.addChild(guanine)
    
    let thymine = SKSpriteNode(imageNamed: "thymine.png")
    thymine.setScale(0.7)
    thymine.position = CGPoint(x: 300, y: -50)
    scene.addChild(thymine)
    
    let cytosine = SKSpriteNode(imageNamed: "cytosine.png")
    cytosine.setScale(0.7)
    cytosine.position = CGPoint(x: 410, y: -50)
    scene.addChild(cytosine)
    
    let moveNucleotide = SKAction.moveBy(x: 0, y: 320, duration: 2)
    let wait = SKAction.wait(forDuration: 5.0)
    
    adenine.run(SKAction.sequence([moveNucleotide, wait]))
    thymine.run(SKAction.sequence([moveNucleotide, wait]))
    guanine.run(SKAction.sequence([moveNucleotide, wait]))
    cytosine.run(SKAction.sequence([moveNucleotide, wait]))
    
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

addBubbles(context: scene)
buildNucleotides()

let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view

