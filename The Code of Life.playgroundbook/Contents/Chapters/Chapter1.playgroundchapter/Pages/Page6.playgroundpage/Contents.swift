/*:
 ## DNA Replication
When a cell divides, your DNA needs to make copies of itself so each of your cells has a full set of DNA! Remember the nucleotide pairing rules? This allows DNA to copy itself, since it can make the second strand from the first one. You can read more about this [here](https://en.wikipedia.org/wiki/DNA_replication) if you'd like.
 
 In programming, we have a name for things like these: **functions**. Functions are used to store pieces of code that are repeated often. We use the `func` keyword to define functions. Here's an example: We define the function, and then call it with `walk()`.
 
 ```
 func walk() {
        moveLeftLeg()
        moveRightLeg()
 }
 walk()
 ```
 
 **Your Turn:** Name the function below `dnaReplication()` (or something else) and then call it to replicate the DNA. Don't forget the parantheses!
  */
//#-hidden-code
import UIKit
import SpriteKit
import PlaygroundSupport
import AVFoundation

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

let originaldna1 = SKSpriteNode(imageNamed: "originaldna1.png")
originaldna1.setScale(0.5)
originaldna1.position = CGPoint(x: 226, y: 192)
scene.addChild(originaldna1)
    
let originaldna2 = SKSpriteNode(imageNamed: "originaldna2.png")
originaldna2.setScale(0.5)
originaldna2.position = CGPoint(x: 259, y: 192)
scene.addChild(originaldna2)

func separateDNA() {
    let moveLeft = SKAction.moveBy(x: -100, y: 0, duration: 2)
    let moveRight = SKAction.moveBy(x: 100, y: 0, duration: 2)
    
    originaldna1.run(moveLeft)
    originaldna2.run(moveRight)
}

func copyDNA() {
    let newdna2 = SKSpriteNode(imageNamed: "newdna2.png")
    newdna2.setScale(0.5)
    newdna2.position = CGPoint(x: 159, y: 192)
    let copyLeft = SKAction.run {
        scene.addChild(newdna2)
    }
    
    let newdna1 = SKSpriteNode(imageNamed: "newdna1.png")
    newdna1.setScale(0.5)
    newdna1.position = CGPoint(x: 326, y: 192)
    let copyRight = SKAction.run {
        scene.addChild(newdna1)
    }
    
    let wait = SKAction.wait(forDuration: 2.5)
    let short = SKAction.wait(forDuration: 1)
    scene.run(SKAction.sequence([wait, copyLeft, short, copyRight]))
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

let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view

func checkAnswer() -> Bool {
    let definition = PlaygroundPage.current.text.components(separatedBy: "name this function*/")[2].components(separatedBy: "/*#-end-editable-code*/")[0]
    
    let call = PlaygroundPage.current.text.components(separatedBy: "call the function here*/")[2].components(separatedBy: "/*#-end-editable-code*/")[0]
    
    return (definition == call)
}
var successAudio = AVAudioPlayer()

func successSound() {
    let successPath = Bundle.main.path(forResource: "magicChime", ofType: "mp3")
    do { try successAudio = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: successPath!) as URL)
    } catch {
        print("Nope")
    }
    successAudio.play()
}

var failAudio = AVAudioPlayer()

func failSound() {
    let failPath = Bundle.main.path(forResource: "clangWobble", ofType: "mp3")
    do { try failAudio = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: failPath!) as URL)
    } catch {
        print("Nope")
    }
    failAudio.play()
}

let success = NSLocalizedString("### Great job! 🎉\nYou've written a function to represent DNA replication!\n\nI hope you've enjoyed this introduction to DNA and Swift programming, and hopefully I'll see you at WWDC this year! 👩🏼‍💻", comment:"Success message")
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, dnaReplication())
func /*#-editable-code name this function*//*#-end-editable-code*/ {
    separateDNA()
    copyDNA()
}
/*#-editable-code call the function here*//*#-end-editable-code*/
//#-hidden-code
if checkAnswer() {
    let pause = SKAction.wait(forDuration: 4)
    let pass = SKAction.run {
        successSound()
        PlaygroundPage.current.assessmentStatus = .pass(message: success)
    }
    scene.run(SKAction.sequence([pause, pass]))
} else {
    failSound()
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Are you sure your function definition matches your function call? Try again! 💪"], solution: nil)
}
//#-end-hidden-code
