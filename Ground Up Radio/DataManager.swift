//
//  DataManager.swift
//  Ground Up Radio
//
//  Created by I AM PR Agency on 3/28/17.
//  Copyright © 2017 Avenir Design. All rights reserved.
//

import UIKit

class DataManager {
    class func getStationDataWithSuccess(success: @escaping ((_ metaData: Data?) -> Void)) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            if useLocalStations {
                getDataFromFileWithSuccess() { data in
                    success(data)
                }
            } else {
                loadDataFromURL(url: URL(string: stationDataURL)!) { data, error in
                    if let urlData = data {
                        success(urlData)
                    }
                }
            }
        }
    }
    
    class func getDataFromFileWithSuccess(success: (_ data: Data) -> Void) {
        if let filePath = Bundle.main.path(forResource: "stations", ofType: "json") {
            do {
                let data = try NSData(contentsOfFile: filePath,
                                      options: NSData.ReadingOptions.uncached) as Data
                success(data)
            } catch {
                fatalError()
            }
        } else {
            print("The local JSON file could not be found")
        }
        
    }
    
    
    class func getTrackDataWithSuccess(queryURL: String, success: @escaping ((_ metaData: Data?) -> Void)) {
        
        loadDataFromURL(url: URL(string: queryURL)!) { data, _ in
            // Return Data
            if let urlData = data {
                success(urlData)
            } else {
                if kDebugLog { print("API TIMEOUT OR ERROR") }
            }
        }
    }
    
    class func loadDataFromURL(url: URL, completion:@escaping (_ data: Data?, _ error: Error?) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.allowsCellularAccess = true
        sessionConfig.timeoutIntervalForRequest = 15
        sessionConfig.timeoutIntervalForResource = 30
        sessionConfig.httpMaximumConnectionsPerHost = 1
        
        let session = URLSession(configuration: sessionConfig)
        let loadDataTask = session.dataTask(with: url){ data, response, error in
            if let responseError = error {
                completion(nil, responseError)
                
                if kDebugLog { print("API ERROR: \(error)") }
                
                // Stop activity Indicator
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"com.matthewfecher", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    
                    if kDebugLog { print("API: HTTP status code has unexpected value") }
                    
                    completion(nil, statusError)
                    
                } else {
                    
                    // Success, return data
                    completion(data, nil)
                }
            }
        }
        loadDataTask.resume()
    }
}
