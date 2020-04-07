//
//  Setup.swift
//  Math
//
//  Created by 90304395 on 2/12/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import UIKit

class Setup:UIViewController{
    
    @IBOutlet weak var ba: UIButton!
    @IBOutlet weak var bm: UIButton!
    @IBOutlet weak var bd: UIButton!
    @IBOutlet weak var bs: UIButton!
    
    let Vmult = "*"
    let Vdiv = "/"
    let Vadd = "+"
    let Vsub = "-"
    
    var active: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if active.contains(Vadd){
            ba.backgroundColor = UIColor.green
        }
        else{
            ba.backgroundColor = UIColor.red
        }
        
        if active.contains(Vmult){
            bm.backgroundColor = UIColor.green
        }
        else{
            bm.backgroundColor = UIColor.red
        }
        if active.contains(Vdiv){
            bd.backgroundColor = UIColor.green
        }
        else{
            bd.backgroundColor = UIColor.red
        }
        if active.contains(Vsub){
            bs.backgroundColor = UIColor.green
        }
        else{
            bs.backgroundColor = UIColor.red
        }
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Starting
        {
            let vc = segue.destination as? Starting
           
            vc?.active = active
        }
        
        
    }
    

    @IBAction func add(_ sender: UIButton) {
        
        if active.contains(Vadd){
            active.remove(at: active.firstIndex(of:Vadd)!)
            
                sender.backgroundColor = UIColor.red
            
        }
        else{
            
            active.append(Vadd)
            sender.backgroundColor = UIColor.green
        }
            
    }
    @IBAction func mult(_ sender: UIButton) {
        if active.contains(Vmult){
            active.remove(at: active.firstIndex(of:Vmult)!)
            
                sender.backgroundColor = UIColor.red
            
        }
        else{
            
            active.append(Vmult)
            sender.backgroundColor = UIColor.green
        }
    }
    
    @IBAction func dev(_ sender: UIButton) {
        if active.contains(Vdiv){
            active.remove(at: active.firstIndex(of:Vdiv)!)
            
                sender.backgroundColor = UIColor.red
            
        }
        else{
            
            active.append(Vdiv)
            sender.backgroundColor = UIColor.green
        }
    }

    @IBAction func sub(_ sender: UIButton) {
        if active.contains(Vsub){
            active.remove(at: active.firstIndex(of:Vsub)!)
            
                sender.backgroundColor = UIColor.red
            
        }
        else{
            
            active.append(Vsub)
            sender.backgroundColor = UIColor.green
        }
    }
    
}
    
    

