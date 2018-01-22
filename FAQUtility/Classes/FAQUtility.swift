//
//  Utility.swift
//  Pods
//
//  Created by FAQ iMac Dhaka on 1/17/18.
//
//

import Foundation
import SystemConfiguration

public class FAQUtility {
    
    public class func isEmptyString(_ value:String) -> Bool {
        if value.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    public class func getDate(FromUTC inDateString: String) -> Date {
        
        var currentInDate = inDateString
        
        if (currentInDate.contains(".")) {
            let splittedDate = currentInDate.components(separatedBy: ".")
            
            currentInDate = splittedDate[0]
            
            if splittedDate[1].contains("+") {
                let tempSplitttedDate = splittedDate[1].components(separatedBy:"+");
                currentInDate += "+" + tempSplitttedDate[1];
            }
            
            if splittedDate[1].contains("-") {
                let tempSplitttedDate = splittedDate[1].components(separatedBy:"-");
                currentInDate += "-" + tempSplitttedDate[1];
            }
            
            if splittedDate[1].contains("Z") {
                currentInDate += "Z"
            }
            
        }
        
        let dateFormatter = DateFormatter()
        if currentInDate.count > 0 {
            print(getDateFormatFromString(currentInDate))
            dateFormatter.dateFormat = getDateFormatFromString(currentInDate)
            if let currentDate = dateFormatter.date(from: currentInDate){
                return currentDate
            }
        }
        
        return Date()
        
    }
    
    public class func getDateString(FromDate lDate:Date, inFormat lFormat: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = lFormat
        return dateFormatter.string(from: lDate)
        
    }
    
    public class  func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    
    // MARK:- file private methods
    
    fileprivate class func getDateFormatFromString(_ utcDate: String) -> String {
        
        switch utcDate.count {
        case 4:
            return "yyyy";
        case 7:
            return "yyyy-MM";
        case 10:
            return "yyyy-MM-dd";
        default:
            return getComplexUtcFormat(utcDate);
        }
        
    }

    fileprivate class func getComplexUtcFormat(_ utcDate: String) -> String {

        if utcDate[utcDate.index(utcDate.startIndex, offsetBy: 16)] != ":" {
            return "yyyy-MM-dd'T'HH:mmZ"
        } else {
            return "yyyy-MM-dd'T'HH:mm:ssZ"
        }

    }
}
