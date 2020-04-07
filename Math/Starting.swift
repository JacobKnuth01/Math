//
//  Starting.swift
//  Math
//
//  Created by 90304395 on 2/12/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import UIKit

class Starting:UIViewController{
    
    let mult = "*"
    let div = "/"
    let add = "+"
    let sub = "-"
    
    var active: [String] = ["+"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(active)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Setup
        {
            let vc = segue.destination as? Setup
            vc?.active = active
        }
        
        else if segue.destination is Maingame{
            let vc = segue.destination as? Maingame
            vc?.active = active
        }
    }
    
}
