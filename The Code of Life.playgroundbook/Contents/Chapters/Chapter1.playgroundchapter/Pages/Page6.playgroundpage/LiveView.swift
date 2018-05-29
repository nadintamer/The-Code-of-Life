import UIKit
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

func buildDNA() {
    let originaldna1 = SKSpriteNode(imageNamed: "originaldna1.png")
    originaldna1.setScale(0.5)
    originaldna1.position = CGPoint(x: 226, y: 192)
    scene.addChild(originaldna1)
    
    let originaldna2 = SKSpriteNode(imageNamed: "originaldna2.png")
    originaldna2.setScale(0.5)
    originaldna2.position = CGPoint(x: 259, y: 192)
    scene.addChild(originaldna2)
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

