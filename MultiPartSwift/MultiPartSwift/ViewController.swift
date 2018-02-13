//
//  ViewController.swift
//  MultiPartSwift
//
//  Created by datt on 13/02/18.
//  Copyright © 2018 Datt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.url(forResource: "test", withExtension: "jpg")?.path
        let dicParameetrs = ["a_id": "1", "b_id": "3"]
        let arrFiles = [
            [multiPartFieldName: "images[]",/*(if only 1 file upload don't use [])*/
             multiPartPathURLs: [filePath, filePath]],
            [multiPartFieldName: "video",
             multiPartPathURLs: ["/Users/xyz/.../abc.mp4"]],
            [multiPartFieldName: "pdf[]",
             multiPartPathURLs: ["/Users/xyz/.../xyz.pdf", "/Users/xyz/.../h.pdf"]]
        ]
//        let arrFiles = [[multiPartFieldName: "file",
//                        multiPartPathURL: [filePath]]]
        MultiPart().callPostWebService("www.xyz.com/../..", parameetrs: dicParameetrs, filePathArr: arrFiles) { (dic, error) in
            
            if (error == nil) {
                print(error ?? "")
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

