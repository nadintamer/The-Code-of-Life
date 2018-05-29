/*:
 ## Welcome! ☺️
 I made this Swift Playground book to teach kids about two of my favorite topics: Programming and biology. For the best experience, please hold the iPad in portrait orientation and turn on sound!
 
 In the next three minutes, you'll learn about the basics of the Swift programming language and DNA! Ready to have some fun?
 
 **Your First Step:** Type `begin()` below and tap "Run my Code" to get started!
 
 *All images in this Swift Playground book were made by me on [make8bitart.com](http://make8bitart.com/). All sound effects are from the [YouTube Audio Library](https://www.youtube.com/audiolibrary/soundeffects/).*
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
let view = SKView(frame: frame)

let short = SKAction.wait(forDuration: 1)

func begin() {
    let mac2 = SKSpriteNode(imageNamed: "mac2.png")
    mac2.position = midPoint
    mac2.setScale(0.5)
    
    let mac3 = SKSpriteNode(imageNamed: "mac3.png")
    mac3.position = midPoint
    mac3.setScale(0.5)
    
    let turnOn = SKAction.run {
        scene.addChild(mac2)
    }
    let showText = SKAction.run {
        scene.addChild(mac3)
    }
    
    view.presentScene(scene)
    PlaygroundPage.current.liveView = view
    
    scene.run(SKAction.sequence([turnOn, short, showText]))
}

//Work-Around for AVAudioPlayer Issue
func stay() {
    let mac = SKSpriteNode(imageNamed: "mac1.png")
    mac.position = midPoint
    mac.setScale(0.5)
    scene.addChild(mac)
    
    view.presentScene(scene)
    PlaygroundPage.current.liveView = view
}

public enum AssessmentResults {
    case pass(message: String)
    case fail(hints: [String], solution: String?)
}

var success = NSLocalizedString("### Congratulations! \nYou’ve written your first lines of Swift code. Now let's (literally) dive a little deeper! ✨\n\n[**Next Page**](@next)", comment:"Success message")

func checkAnswer() -> Bool {
    let solution = "begin()"
    let answer = PlaygroundPage.current.text.components(separatedBy: "//#-editable-code Tap here to enter your code")[2].components(separatedBy: "//#-end-editable-code")[0]
    
    return answer.contains(solution)
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
//#-code-completion(identifier, show, begin())
//#-editable-code Tap here to enter your code
//#-end-editable-code
//#-hidden-code
let wait = SKAction.wait(forDuration: 2)
if checkAnswer() {
    let pass = SKAction.run {
        successSound()
        PlaygroundPage.current.assessmentStatus = .pass(message: success)
    }
    scene.run(SKAction.sequence([wait, pass]))
} else {
    stay()
    let fail = SKAction.run {
        failSound()
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Are you sure you typed exactly `begin()`? Try again! 💪"], solution: nil)
    }
    scene.run(fail)
}
//#-end-hidden-code







