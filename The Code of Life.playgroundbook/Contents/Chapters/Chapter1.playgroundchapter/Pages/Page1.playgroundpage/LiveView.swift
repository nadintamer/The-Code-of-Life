import UIKit
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 480, height: 384)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor(displayP3Red: 158.0/255, green: 208.0/255, blue: 255.0/255, alpha: 1.0)

func addMac() {
    let mac = SKSpriteNode(imageNamed: "mac1.png")
    mac.position = midPoint
    mac.setScale(0.5)
    scene.addChild(mac)
}

addMac()
let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view
