//
//  ViewController.swift
//  Math
//
//  Created by 90304395 on 2/8/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import UIKit



class Maingame: UIViewController {
    
    @IBOutlet weak var mathW: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var b4: UIButton!
    
    @IBOutlet weak var affter: UIButton!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var CountDown: UILabel!
    
    
    let TIMEPERROUND = 30
    
    var timer:Timer?
    
    
    
    let mult = "*"
    let div = "/"
    let add = "+"
    let sub = "-"
    
    var active: [String] = [String]()
    var buttons:[UIButton] = [UIButton]()
    var equations:[equation] = []
    var answer:Int?
    
    
    var player = stats()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if active == []{
            active.append(add)
        }
        
        buttons = [b1, b2, b3, b4]
        affter.isHidden = true
        updateScore()
        round()
        CountDown.text = String(TIMEPERROUND)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        
        
        
        
        
        
    }
    
   
        
        
    
    @objc func count(){
        if CountDown.text == "0"{
            timer?.invalidate()
            performSegue(withIdentifier: "outOfTime", sender: nil)
            return
        }
        CountDown.text = String(Int(CountDown.text!)! - 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is gameOver
        {
            
            let vc = segue.destination as? gameOver
            vc?.score = score.text!
            vc?.active = active
            vc?.equations = equations
            vc?.time = TIMEPERROUND
            
        }
        
    }
    
    func updateScore(){
        score.text = ("Correct: " + String(player.correct) + "\n" + "Wrong: " + String(player.wrong) + "\n" +  "Total: " + String(player.totalQ)).uppercased()
        
    }
    func round(){
        allActive()
        for i in buttons{
            i.backgroundColor = UIColor.black
        }
        
        var formula = genEcuation()
        
        display(n1: formula.0, sign: formula.1, n2: formula.2, a: formula.3)
        answer = formula.3
    }
    
    func allActive(){
        for i in buttons{
            i.isUserInteractionEnabled = true
        }
    }
    
    func allDeactive(){
        for i in buttons{
            i.isUserInteractionEnabled = false
        }
    }
    
    func genEcuation() -> (Int, String, Int,Int){
        var sign = active.randomElement()
        var n1: Int = 0
        var n2: Int = 0
        
        var a: Int = 0
        equations.append(equation())
        equations[equations.endIndex - 1].type = sign

        if sign == mult{
                        n1 = Int.random(in:0...12)
            n2 = Int.random(in:0...12)
            
            
            a = n1 * n2
        }
        
        else if sign == sub || sign == add{
            n1 = Int.random(in:0...100)
            n2 = Int.random(in:0...100)
            
            if sub == sign{
                a = n1 - n2
            }
            else{
                a = n1 + n2
            }
                
        }
        else{
            var int = false
            
            while int != true{
                
                
                 n1 = Int.random(in:0...100)
                 n2 = Int.random(in:1...100)
                
                
                var temp  = Double(n1) / Double(n2)
                
                if temp.rounded(.up) ==
                    temp.rounded(.down){
                    a = Int(temp)
                    int = true
                    
                }
                
                
            }
            
        }
            
    return (n1, sign!, n2, a)
    }
    
    
    func display(n1:Int, sign:String, n2:Int, a:Int){
        mathW.text = String(n1) + sign + String(n2) + "=" 
        
        for i in buttons{
            var fake = Int.random(in:-10...10) + a
            
            i.setTitle(String(fake), for: .normal)        }
        buttons[Int.random(in: 0...buttons.count - 1)].setTitle(String(a), for: .normal)
    }
    
    func correct(sender: UIButton){
        var label = String(sender.titleLabel!.text!)
        if label == String(answer!){
            player.totalQ+=1
            player.correct+=1
            sender.backgroundColor = UIColor.green
            equations[equations.endIndex - 1].correct = true
            
        }
        else{
            player.totalQ+=1
            player.wrong+=1
            sender.backgroundColor = UIColor.red
            mathW.text = String(answer!)
            equations[equations.endIndex - 1].correct = false
            
        }
        allDeactive()
        affter.isHidden = false
        updateScore()
        }
    
        
    
    @IBAction func touch1(_ sender: UIButton) {
        correct(sender: sender)
    }
    @IBAction func b2Touch(_ sender: UIButton) {
        correct(sender: sender)
    }
    @IBAction func touch3(_ sender: UIButton) {
        correct(sender: sender)
    }
    @IBAction func touch4(_ sender: UIButton) {
        correct(sender: sender)
    }
    @IBAction func touch5(_ sender: UIButton) {
        round()
        sender.isHidden = true
    }
    
    
}

