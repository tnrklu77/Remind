//
//  AlertTableView.swift
//  Remind
//
//  Created by Ömer Tanrıkulu on 31.10.2022.
//

import Foundation
import UIKit
import PureLayout

class AlertTableViewCell : UITableViewCell {
    
    static let identifier = "AlertTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
   

    }
    func setupView(){
        
        containerView.autoSetDimension(.height, toSize: 190.0)
        
        
        addSubview(containerView)
        
        addSubview(subtitleLbl)
        
        addSubview(messageText)
        addSubview(dateLbl)
        

        
        messageText.lineBreakMode = .byWordWrapping
        messageText.sizeToFit()
        messageText.autoPinEdge(toSuperviewEdge: .top, withInset: 3)
        
        
        messageText.textAlignment = .left
        
        messageText.autoSetDimension(.height, toSize: 20)
        
        
        
        
        
        subtitleLbl.textColor = UIColor(red: 135/255, green: 153/255, blue: 165/255, alpha: 1)
        subtitleLbl.autoSetDimension(.height, toSize: 19)
//        subtitleLbl.autoPinEdge(.bottom, to: .bottom, of: messageText, withOffset: 20)
        subtitleLbl.autoPinEdge(.top, to: .bottom, of: messageText, withOffset: 15)
        
        
        
        dateLbl.autoPinEdge(toSuperviewEdge: .right)
        dateLbl.autoSetDimensions(to: CGSize(width: 85, height: 17))
        dateLbl.autoPinEdge(.bottom, to: .bottom, of: messageText)
        
        setupConstraints()
        
    }
    func setupConstraints(){
        containerView.autoPinEdgesToSuperviewEdges()
        
       
    }
    lazy var containerView: UIView = {
        let cv = UIView.newAutoLayout()
        return cv
    }()
    lazy var subtitleLbl: UILabel = {
        let name = UILabel.newAutoLayout()
        return name
    }()
    lazy var dateLbl: UILabel = {
        let date = UILabel.newAutoLayout()
        date.textAlignment = .right
        return date
    }()
    lazy var messageText: UILabel = {
        let name = UILabel.newAutoLayout()
        return name
    }()


}
