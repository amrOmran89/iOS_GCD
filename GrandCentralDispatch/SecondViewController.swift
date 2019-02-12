//
//  SecondViewController.swift
//  GrandCentralDispatch
//
//  Created by Amr Omran on 02/02/2019.
//  Copyright © 2019 Amr Omran. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /**
     Global Queue is executed first because it is Sync Queue
     */
    @IBAction func mainAsyncBtn(_ sender: Any) {
       // Main serial Async
        DispatchQueue.main.async {
            for _ in 0...4 {
                print("🥰")
            }
        }
        // Gloabal Highest Prioirity Sync
        DispatchQueue.global(qos: .userInteractive).sync {
            for _ in 0...4 {
                print("😂")
            }
        }
    }
    
    
    
    @IBAction func globalSyncBtn(_ sender: Any) {
        // Global Highest Prioirity Sync
        DispatchQueue.global(qos: .userInteractive).sync {
            for _ in 0...4 {
                print("😡")
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in 0...4 {
                print("😎")
            }
        }
    }
    
    
    @IBAction func globalAsyncBtn(_ sender: Any) {
        
        DispatchQueue.global(qos: .utility).async {
            for _ in 0...4 {
                print("😎")
            }
        }
        
        DispatchQueue.global(qos: .utility).async {
            for _ in 0...4 {
                print("🥰")
            }
        }
        
    }
    
    @IBAction func customQueueBtn(_ sender: Any) {
    }
    
}
