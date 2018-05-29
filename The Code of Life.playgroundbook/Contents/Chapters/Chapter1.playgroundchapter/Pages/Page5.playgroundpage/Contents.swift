/*:
 ## If Statements
 Programmers need a way to control when their code executes. For example, we would only want somebody to be able to log into our computer if they entered the right password! To check for such conditions, we use commands called **if statements**. These statements only execute **if the condition they state is true**.
 
 There is a data type in Swift that is used in if statements. It's called a **boolean** (Bool). Booleans can be either **true** or **false**; there's no in between. It's like how you can either **have a pet** or **not have a pet**. You can't have half a pet! In Swift, we define boolean values just like we define other values (using `let` or `var`).
 
 **Important:** We use = when assigning values (with `let` or `var`) but == when checking if two values are equal (in if statements)!
 
 **Your Turn:** Fill in the blanks in the if statements below so that they correctly represent nucleotide pairing in DNA. (Remember that A pairs with T and C pairs with G!)
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

func buildNucleotides() {
    let adenine = SKSpriteNode(imageNamed: "adenine.png")
    adenine.setScale(0.7)
    adenine.position = CGPoint(x: 70, y: 270)
    scene.addChild(adenine)
    
    let guanine = SKSpriteNode(imageNamed: "guanine.png")
    guanine.setScale(0.7)
    guanine.position = CGPoint(x: 185, y: 270)
    scene.addChild(guanine)
    
    let thymine = SKSpriteNode(imageNamed: "thymine.png")
    thymine.setScale(0.7)
    thymine.position = CGPoint(x: 300, y: 270)
    scene.addChild(thymine)
    
    let cytosine = SKSpriteNode(imageNamed: "cytosine.png")
    cytosine.setScale(0.7)
    cytosine.position = CGPoint(x: 410, y: 270)
    scene.addChild(cytosine)
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

let images = ["A": "adenine.png", "G": "guanine.png", "T": "thymine.png", "C": "cytosine.png"]
let xPositions = ["A": 70, "G": 185, "T": 300, "C": 410]
let moveNucleotide = SKAction.moveBy(x: 0, y: 195, duration: 2)

let hydrogenBondA = SKSpriteNode(imageNamed: "hydrogenbond.png")
hydrogenBondA.setScale(0.3)
hydrogenBondA.position = CGPoint(x: xPositions["A"]!, y: 207)

let nucleotideAnswerA = SKSpriteNode(imageNamed: images["T"]!)
nucleotideAnswerA.setScale(0.7)
nucleotideAnswerA.position = CGPoint(x: xPositions["A"]!, y: -50)
scene.addChild(nucleotideAnswerA)
nucleotideAnswerA.run(moveNucleotide)
let wait = SKAction.wait(forDuration: 2.5)
let bondWithA = SKAction.run {
    scene.addChild(hydrogenBondA)
}
scene.run(SKAction.sequence([wait, bondWithA]))

func checkAnswers() -> Bool {
    let wait = SKAction.wait(forDuration: 2.5)
    
    let answerG = PlaygroundPage.current.text.components(separatedBy: "Which nucleotide pairs with G?*/\"")[1].components(separatedBy: "\"/*#-end-editable-code*/")[0].uppercased()
    if !(images.keys.contains(answerG)) {
        print()
    } else {
        let nucleotideAnswerG = SKSpriteNode(imageNamed: images[answerG]!)
        nucleotideAnswerG.setScale(0.7)
        nucleotideAnswerG.position = CGPoint(x: xPositions["G"]!, y: -50)
        scene.addChild(nucleotideAnswerG)
        nucleotideAnswerG.run(moveNucleotide)
    }
    
    if (answerG == "C") {
        let hydrogenBondG = SKSpriteNode(imageNamed: "hydrogenbond.png")
        hydrogenBondG.setScale(0.3)
        hydrogenBondG.position = CGPoint(x: xPositions["G"]!, y: 207)
        let bondWithG = SKAction.run {
            scene.addChild(hydrogenBondG)
        }
        scene.run(SKAction.sequence([wait, bondWithG]))
    }
    
    let answerT = PlaygroundPage.current.text.components(separatedBy: "Which nucleotide pairs with T?*/\"")[1].components(separatedBy: "\"/*#-end-editable-code*/")[0].uppercased()
    if !(images.keys.contains(answerT)) {
        print()
    } else {
        let nucleotideAnswerT = SKSpriteNode(imageNamed: images[answerT]!)
        nucleotideAnswerT.setScale(0.7)
        nucleotideAnswerT.position = CGPoint(x: xPositions["T"]!, y: -50)
        scene.addChild(nucleotideAnswerT)
        nucleotideAnswerT.run(moveNucleotide)
    }
    
    if (answerT == "A") {
        let hydrogenBondT = SKSpriteNode(imageNamed: "hydrogenbond.png")
        hydrogenBondT.setScale(0.3)
        hydrogenBondT.position = CGPoint(x: xPositions["T"]!, y: 207)
        let bondWithT = SKAction.run {
            scene.addChild(hydrogenBondT)
        }
        scene.run(SKAction.sequence([wait, bondWithT]))
    }
    
    let answerC = PlaygroundPage.current.text.components(separatedBy: "Which nucleotide pairs with C?*/\"")[1].components(separatedBy: "\"/*#-end-editable-code*/")[0].uppercased()
    if !(images.keys.contains(answerC)) {
        print()
    } else {
        let nucleotideAnswerC = SKSpriteNode(imageNamed: images[answerC]!)
        nucleotideAnswerC.setScale(0.7)
        nucleotideAnswerC.position = CGPoint(x: xPositions["C"]!, y: -50)
        scene.addChild(nucleotideAnswerC)
        nucleotideAnswerC.run(moveNucleotide)
    }
    
    if (answerC == "G") {
        let hydrogenBondC = SKSpriteNode(imageNamed: "hydrogenbond.png")
        hydrogenBondC.setScale(0.3)
        hydrogenBondC.position = CGPoint(x: xPositions["C"]!, y: 207)
        let bondWithC = SKAction.run {
            scene.addChild(hydrogenBondC)
        }
        scene.run(SKAction.sequence([wait, bondWithC]))
    }
    
    return (answerG == "C" && answerT == "A" && answerC == "G")
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

let success = NSLocalizedString("### Fantastic! 🎉\nYou've figured out how to apply if statements to nucleotide pairing.\n\n[**Next Page**](@next)", comment:"Success message")
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(literal, show, "A")
//#-code-completion(literal, show, "C")
//#-code-completion(literal, show, "G")
//#-code-completion(literal, show, "T")
// I've done the first one as an example!
let firstNucleotide = "A"
if (firstNucleotide == "A") {
    let pairsWithA = "T"
}

let secondNucleotide = "G"
if (secondNucleotide == "G") {
    let pairsWithG = /*#-editable-code Which nucleotide pairs with G?*/""/*#-end-editable-code*/
}

let thirdNucleotide = "T"
if (thirdNucleotide == "T") {
    let pairsWithT = /*#-editable-code Which nucleotide pairs with T?*/""/*#-end-editable-code*/
}

let fourthNucleotide = "C"
if (fourthNucleotide == "C") {
    let pairsWithC = /*#-editable-code Which nucleotide pairs with C?*/""/*#-end-editable-code*/
}
//#-hidden-code
if checkAnswers() {
    let pass = SKAction.run {
        successSound()
        PlaygroundPage.current.assessmentStatus = .pass(message: success)
    }
    scene.run(SKAction.sequence([wait, pass]))
} else {
    failSound()
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Are you sure you matched the nucleotides correctly? Try again! 💪\n\n Remember, A pairs with T and C pairs with G!"], solution: nil)
}
//#-end-hidden-code
