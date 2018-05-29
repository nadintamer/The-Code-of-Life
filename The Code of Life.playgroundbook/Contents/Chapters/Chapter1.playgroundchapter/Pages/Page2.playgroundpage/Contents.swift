/*:
 ## What is DNA?
That chain-like thing up there is your DNA! DNA is found in each of the cells that make up your body. 
 
DNA is the reason you look a lot like your parents: you get DNA from both your mom and your dad! DNA codes for your physical appearance, and all the amazing things that your body can do, like running, digesting food or even sleeping!
 
This is similar to how you just programmed a computer to do something. Let's learn more about Swift by exploring the things that DNA codes for. 💡
 
 **Your Turn:** Tap "Run my Code" (you don't need to change anything!) and touch the red buttons that appear to see examples of what traits that DNA codes for! Hit "Next Page" below when you're ready to move on to the next page.
 
 [**Next Page**](@next)
 */
//#-hidden-code
import UIKit
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

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

class SKButton : SKSpriteNode {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "eyeButton"
            {
                let eye = SKLabelNode(text: "your eye color")
                eye.fontColor = .black
                eye.position = CGPoint(x: 110, y: 265)
                scene!.addChild(eye)
                
                let eyes = SKSpriteNode(imageNamed: "eyes.png")
                eyes.setScale(0.5)
                eyes.position = CGPoint(x: 110, y: 245)
                scene!.addChild(eyes)
            }
            if name == "hairButton" {
                let hair = SKLabelNode(text: "your hair color")
                hair.fontColor = .black
                hair.position = CGPoint(x: 370, y: 190)
                scene!.addChild(hair)
                
                let hairImg = SKSpriteNode(imageNamed: "hair.png")
                hairImg.setScale(0.25)
                hairImg.position = CGPoint(x: 370, y: 160)
                scene!.addChild(hairImg)
            }
            if name == "heightButton" {
                let height = SKLabelNode(text: "your height")
                height.fontColor = .black
                height.position = CGPoint(x: 110, y: 115)
                scene!.addChild(height)
                
                let ruler = SKSpriteNode(imageNamed: "height.png")
                ruler.setScale(0.5)
                ruler.position = CGPoint(x: 110, y: 95)
                scene!.addChild(ruler)
            }
        }
        
    }
}

func addTraits() {
    let eyeButton = SKButton(imageNamed: "redCircle.png")
    eyeButton.alpha = 0.5
    eyeButton.setScale(0.05)
    eyeButton.name = "eyeButton"
    eyeButton.isUserInteractionEnabled = true
    eyeButton.position = CGPoint(x: frame.size.width / 2.0, y: 265)
    scene.addChild(eyeButton)
    
    let hairButton = SKButton(imageNamed: "redCircle.png")
    hairButton.alpha = 0.5
    hairButton.setScale(0.05)
    hairButton.name = "hairButton"
    hairButton.isUserInteractionEnabled = true
    hairButton.position = CGPoint(x: frame.size.width / 2.0, y: 190)
    scene.addChild(hairButton)
    
    let heightButton = SKButton(imageNamed: "redCircle.png")
    heightButton.alpha = 0.5
    heightButton.setScale(0.05)
    heightButton.name = "heightButton"
    heightButton.isUserInteractionEnabled = true
    heightButton.position = CGPoint(x: frame.size.width / 2.0, y: 115)
    scene.addChild(heightButton)
}

addBubbles(context: scene)
buildDNA()

let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-editable-code
addTraits()
//#-end-editable-code


