//
//  BluServer.swift
//  BlueGlove
//
//  Created by Phillip Pang on 11/23/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import Foundation
import AFNetworking
import BDBOAuth1Manager

protocol BlueClientDelegate: class {
    func addLog(msg: String)
}

class BluClient{
    
    let serverURL = URL(string: "https://blueglove.herokuapp.com/")
    
    func addVisit(){
        
        var request = URLRequest(url: serverURL!.appendingPathComponent("consumer/new") )
        request.httpMethod = "POST"
        let postString = "name=PhillipXcode"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
        
    }
    
}
