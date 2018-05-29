import UIKit
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var intro = SKScene(size: frame.size)
intro.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

let character = SKSpriteNode(imageNamed: "character.png")
character.position = midPoint
character.setScale(0.5)
intro.addChild(character)

let zoomAction = SKAction.scale(to: 2.0, duration: 2.0)
character.run(zoomAction)

var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

func buildDNA() {
    let dna = SKSpriteNode(imageNamed: "dna1.png")
    dna.position = midPoint
    dna.setScale(0.5)
    
    let dna1 = SKTexture(imageNamed: "dna1.png")
    let dna2 = SKTexture(imageNamed: "dna2.png")
    
    let dnaAnimation = [dna1, dna2]
    scene.addChild(dna)
    
    dna.run(SKAction.repeatForever(
        SKAction.animate(with: dnaAnimation, timePerFrame: 0.4)))
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
view.presentScene(intro)
PlaygroundPage.current.liveView = view

let wait = SKAction.wait(forDuration: 2.0)
let newScene = SKAction.run {
    let transition = SKTransition.crossFade(withDuration: 1)
    view.presentScene(scene, transition: transition)
}

intro.run(SKAction.sequence([wait, newScene]))

