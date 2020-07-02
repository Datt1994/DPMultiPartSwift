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
            [MultiPart.fieldName: "images[]",/*(if only 1 file upload don't use [])*/
             MultiPart.pathURLs: [filePath, filePath]],
            [MultiPart.fieldName: "video",
             MultiPart.pathURLs: ["/Users/xyz/.../abc.mp4"]],
            [MultiPart.fieldName: "pdf[]",
             MultiPart.pathURLs: ["/Users/xyz/.../xyz.pdf", "/Users/xyz/.../h.pdf"]]
        ]
//        let arrFiles = [[multiPartFieldName: "file",
//                        multiPartPathURL: [filePath]]]
        // With JSON Object
        MultiPart().callPostWebService("http://www.xyz.com/../..", parameetrs: dicParameetrs, filePathArr: arrFiles) { (dic, error) in
            
            if (error == nil) {
                print(error ?? "")
            }
            
        }
        // With Model Object
        MultiPart().callPostWSWithModel("http://www.xyz.com/../..", parameters: dicParameetrs, filePathArr: arrFiles, model: LoginModel.self) {
            result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let failureResponse):
                print(failureResponse.message ?? "")
            case .error(let e):
                print(e ?? "")
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
struct LoginModel: Decodable {
    var data : LoginData?
    var message : String?
    var status : String?
}
struct LoginData: Decodable {
    
    var profile_path : String?
    var id : Int?
    var fullname : String?
    var email_id : String?
    var status : Bool?
}
