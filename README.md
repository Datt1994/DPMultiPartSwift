## DPMultiPartSwift

Upload videos , images and other files(pdf, doc,..) using MultiPart class Swift 4

**For Objective C** :- [DPMultiPartObjC](https://github.com/Datt1994/multiPart)

**Step 1**:-  Copy & paste `MultiPart.swift` file into your project 

**Step 2**:-  Usage 
```swift
        let filePath = Bundle.main.url(forResource: "test", withExtension: "jpg")?.path
        
        let dicParameetrs = ["a_id": "1", "name": "Datt"]
        
        let arrFiles = [
            [multiPartFieldName: "images[]",/*(if only 1 file upload don't use [])*/
             multiPartPathURLs: [filePath, filePath]],
            [multiPartFieldName: "video",
             multiPartPathURLs: ["/Users/xyz/.../abc.mp4"]],
            [multiPartFieldName: "pdf[]",
             multiPartPathURLs: ["/Users/xyz/.../xyz.pdf", "/Users/xyz/.../h.pdf"]]
        ]
        
        MultiPart().callPostWebService("www.xyz.com/../..", parameetrs: dicParameetrs, filePathArr: arrFiles) { (dic, error) in
            
            if (error == nil) {
                print(error ?? "")
            }
            
        }
```
