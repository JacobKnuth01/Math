//
//  gameOver.swift
//  Math
//
//  Created by 90304395 on 2/13/20.
//  Copyright © 2020 90304395. All rights reserved.
//


import UIKit

class gameOver:UIViewController{
    var active:[String]?
    var score:String?
    var equations:[equation]?
    var time:Int?
    
    @IBOutlet weak var a: UILabel!
    
    @IBOutlet weak var s: UILabel!
    
    @IBOutlet weak var m: UILabel!
   
    @IBOutlet weak var d: UILabel!
    
    let mult = "*"
    let div = "/"
    let add = "+"
    let sub = "-"
    var folder:[UILabel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        folder!.append(a)
        folder!.append(s)
        folder!.append(m)
        folder!.append(d)

        var spot = 0
        
        if  active!.contains(add){
            folder![spot].text = "ADDITION: " + sort(sign: add)
            spot+=1
        }
        if active!.contains(sub){
            folder![spot].text = "SUBTRACTION: " + sort(sign: sub)
            spot+=1
        }
        if active!.contains(mult){
            folder![spot].text = "MULTIPLICATION: " + sort(sign: mult)
            spot+=1
        }
        
        if active!.contains(div){
            folder![spot].text = "DIVISION: " + sort(sign: div)
            spot+=1
        }
        
        
       
        
        
     
        
    }
    
    func sort(sign: String) -> String{
        var total = 0
        var right = 0
        for i in equations!{
            if i.type == sign &&  i.correct != nil{
                total+=1
                
                if i.correct!{
                    right+=1
                }
                
            }
        }
        
        let s =  String(right) + "/" + String(total)
        
        if s == "0/0"{
            return "none"
        }
        else{
            return s
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Starting
        {
            let vc = segue.destination as? Starting
            vc?.active = active!
        }
        
        
    }
    
}
