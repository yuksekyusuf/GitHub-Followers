//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Ahmet Yusuf Yuksek on 10/18/21.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMM yyyy"
        return dateformatter.string(from: self)
    }
    
}
