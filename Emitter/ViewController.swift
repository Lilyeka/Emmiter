//
//  ViewController.swift
//  Emitter
//
//  Created by Лилия Левина on 15/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var emit:CAEmitterLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        initObjects()
    }
    
    func initObjects() {
        let r = UIGraphicsImageRenderer(size: CGSize(width: 10, height: 10))
        let im = r.image { (ctx) in
            let con = ctx.cgContext
            con.addEllipse(in: CGRect(x: 0, y: 0, width: 10, height: 10))
            con.setFillColor(UIColor.gray.cgColor)
            con.fillPath()
        }
        
        let cell = CAEmitterCell()
        cell.contentsScale = UIScreen.main.scale
        cell.birthRate = 100
        cell.lifetime = 1.5
        cell.velocity = 100
        cell.emissionRange = .pi/5
        cell.contents = im.cgImage
        cell.xAcceleration = -40
        cell.yAcceleration = 200
        cell.lifetimeRange = 0.4
        cell.velocityRange = 20
        cell.scaleRange = 0.2
        cell.scaleSpeed = 0.2
        cell.color = UIColor.blue.cgColor
        cell.greenRange = 0.5
        cell.greenSpeed = 0.75
        
        emit = CAEmitterLayer()
        emit.emitterPosition = CGPoint(x:30,y:100)
        emit.emitterShape = .point
        emit.emitterMode = .points
        emit.emitterCells = [cell]
        self.view.layer.addSublayer(emit)
    }
}

