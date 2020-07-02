## DPMultiPartSwift
[![Language: Swift 5](https://img.shields.io/badge/language-swift5-f48041.svg?style=flat)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/DPOTPView.svg?style=flat)](https://github.com/Datt1994/DPMultiPartSwift/blob/master/LICENSE)

Upload videos , images and other files(pdf, doc,..) using MultiPart class Swift 4

**For Objective C** :- [DPMultiPartObjC](https://github.com/Datt1994/multiPart)


## Add Manually 

Download Project and copy-paste `MultiPart.swift` file into your project 


## How to use
```swift
        let filePath = Bundle.main.url(forResource: "test", withExtension: "jpg")?.path
        
        let dicParameetrs = ["a_id": "1", "name": "Datt"]
        
        let arrFiles = [
            [MultiPart.fieldName: "images[]",/*(if only 1 file upload don't use [])*/
             MultiPart.pathURLs: [filePath, filePath]],
            [MultiPart.fieldName: "video",
             MultiPart.pathURLs: ["/Users/xyz/.../abc.mp4"]],
            [MultiPart.fieldName: "pdf[]",
             MultiPart.pathURLs: ["/Users/xyz/.../xyz.pdf", "/Users/xyz/.../h.pdf"]]
        ]
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
```
