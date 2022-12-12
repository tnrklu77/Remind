//
//  InfoView.swift
//  quickTrader
//
//  Created by Ömer Tanrıkulu on 1.11.2022.
//

import Foundation
import UIKit
import PureLayout

class InfoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        
        
        
 
    }
    func setupViews(){
        addSubview(tlLabel)
        tlLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 49)
        tlLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 193)
        
    }
    
    lazy var tlLabel : UILabel = {
        var label = UILabel.newAutoLayout()
        
        return label
    }()
}
