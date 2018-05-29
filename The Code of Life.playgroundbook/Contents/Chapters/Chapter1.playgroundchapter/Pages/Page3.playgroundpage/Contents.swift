/*:
 ## Constants & Variables
 In Swift, you can define **constants** and **variables.** Let's look at what each of these do. **Constants**, as you might guess from the name, never change. They can be used to represent things like your eye color or the number of days in a week. **Variables** are things that can change. They could be used to keep track of things like the score in a game, your height or your hair color.
 
 Have you noticed that you can store both numbers and `"text"` (these are called Strings) in constants and variables?
 
 **Your Turn:** Fill in the code below to store your eye color in the constant `eyeColor`, your height in the variable `height` and your hair color in the variable `hairColor`!
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

func showEyeColor(color: String) {
    let eyeLabel = SKLabelNode(text: color.lowercased())
    eyeLabel.fontColor = .black
    eyeLabel.position = CGPoint(x: 370, y: -40)
    scene.addChild(eyeLabel)
    
    let moveLabel = SKAction.moveBy(x: 0, y: 295, duration: 2)
    eyeLabel.run(moveLabel)
}

func showHeight(h: String) {
    let pause = SKAction.wait(forDuration: 2)
    let heightLabel = SKLabelNode(text: "\(h)")
    heightLabel.fontColor = .black
    heightLabel.position = CGPoint(x: 370, y: -40)
    scene.addChild(heightLabel)
    
    let moveLabel = SKAction.moveBy(x: 0, y: 145, duration: 0.66)
    heightLabel.run(SKAction.sequence([pause, moveLabel]))
}

func showHair(h: String) {
    let pause = SKAction.wait(forDuration: 1)
    let hairLabel = SKLabelNode(text: h.lowercased())
    hairLabel.fontColor = .black
    hairLabel.position = CGPoint(x: 110, y: -40)
    scene.addChild(hairLabel)
    
    let moveLabel = SKAction.moveBy(x: 0, y: 222, duration: 1.33)
    hairLabel.run(SKAction.sequence([pause, moveLabel]))
}

let success = NSLocalizedString("### Nice! 🎉\nYour DNA codes for your eye color, hair color and height!\n\n[**Next Page**](@next)", comment:"Success message")

func checkEyeColor() -> Bool {
    let answer = PlaygroundPage.current.text.components(separatedBy: "your eye color*/\"")[1].components(separatedBy: "\"/*#-end-editable-code*/")[0].lowercased()
    return answer.count > 0
}

func checkHairColor() -> Bool {
    let answer = PlaygroundPage.current.text.components(separatedBy: "your hair color*/\"")[1].components(separatedBy: "\"/*#-end-editable-code*/")[0].lowercased()
    return answer.count > 0
}

func checkHeight() -> Bool {
    let answer = PlaygroundPage.current.text.components(separatedBy: "your height*/\"")[1].components(separatedBy: "\"/*#-end-editable-code*/")[0].lowercased()
    return answer.count > 0
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
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(literal, show, "green")
//#-code-completion(literal, show, "blue")
//#-code-completion(literal, show, "brown")
//#-code-completion(literal, show, "black")
//#-code-completion(literal, show, "gray")
//#-code-completion(literal, show, "amber")
//#-code-completion(literal, show, "hazel")
let daysInAWeek = 7
let eyeColor = /*#-editable-code your eye color*/""/*#-end-editable-code*/

var score = 14
var height = /*#-editable-code your height*/""/*#-end-editable-code*/
var hairColor = /*#-editable-code your hair color*/""/*#-end-editable-code*/
//#-hidden-code
let wait = SKAction.wait(forDuration: 2.5)
if checkEyeColor() && checkHeight() && checkHairColor() {
    showEyeColor(color: eyeColor)
    showHeight(h: height)
    showHair(h: hairColor)
    let pass = SKAction.run {
        successSound()
        PlaygroundPage.current.assessmentStatus = .pass(message: success)
    }
    scene.run(SKAction.sequence([wait, pass]))
} else {
    failSound()
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Are you sure you filled in each box? Try again! 💪"], solution: nil)
}
//#-end-hidden-code
