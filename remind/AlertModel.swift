//
//  AlertModel.swift
//  Remind
//
//  Created by Ömer Tanrıkulu on 31.10.2022.
//

import Foundation

struct AlertModel {
    var subtitle = String()
    var message = String()
    var date = String()
    
    init(subtitle: String = String(), message: String = String(), date: String = String()) {
        self.subtitle = subtitle
        self.message = message
        self.date = date
    }
}
