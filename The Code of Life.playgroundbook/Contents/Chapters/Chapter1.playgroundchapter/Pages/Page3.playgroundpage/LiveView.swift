import UIKit
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

func buildDNA() {
    let dna = SKSpriteNode(imageNamed: "dna1.png")
    let dna1 = SKTexture(imageNamed: "dna1.png")
    dna.position = midPoint
    dna.setScale(0.5)
    
    let dna2 = SKTexture(imageNamed: "dna2.png")
    
    let dnaAnimation = [dna1, dna2]
    scene.addChild(dna)
    
    dna.run(SKAction.repeatForever(
        SKAction.animate(with: dnaAnimation, timePerFrame: 0.4)))
    
    let eye = SKLabelNode(text: "your eye color")
    eye.fontColor = .black
    eye.position = CGPoint(x: 110, y: 265)
    scene.addChild(eye)
    
    let eyes = SKSpriteNode(imageNamed: "eyes.png")
    eyes.setScale(0.5)
    eyes.position = CGPoint(x: 110, y: 245)
    scene.addChild(eyes)
    
    let hair = SKLabelNode(text: "your hair color")
    hair.fontColor = .black
    hair.position = CGPoint(x: 370, y: 190)
    scene.addChild(hair)
    
    let hairImg = SKSpriteNode(imageNamed: "hair.png")
    hairImg.setScale(0.25)
    hairImg.position = CGPoint(x: 370, y: 160)
    scene.addChild(hairImg)
    
    let height = SKLabelNode(text: "your height")
    height.fontColor = .black
    height.position = CGPoint(x: 110, y: 115)
    scene.addChild(height)
    
    let ruler = SKSpriteNode(imageNamed: "height.png")
    ruler.setScale(0.5)
    ruler.position = CGPoint(x: 110, y: 95)
    scene.addChild(ruler)
}

func addBubbles() {
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
    scene.addChild(emitter)
}

addBubbles()
buildDNA()
let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view

