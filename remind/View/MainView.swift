//
//  MainView.swift
//  Remind
//
//  Created by Ömer Tanrıkulu on 22.10.2022.
//

import Foundation
import PureLayout
import UIKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()


        
    }
    func setupViews(){
        addSubview(loginBackgrounds)
        addSubview(messageTextField)
        addSubview(subtitleTextField)
        addSubview(datePicker)
        addSubview(remindButton)
        
        
        

        loginBackgrounds.autoPinEdge(toSuperviewEdge: .left)
        loginBackgrounds.autoPinEdge(toSuperviewEdge: .right)
        loginBackgrounds.autoPinEdge(toSuperviewEdge: .bottom)
        loginBackgrounds.autoPinEdge(toSuperviewEdge: .top)
        loginBackgrounds.backgroundColor = UIColor(red: 79/255, green: 79/255, blue: 79/255, alpha: 1)

        
        messageTextField.autoSetDimensions(to: CGSize(width: 100, height: 45))
        messageTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 40)
        messageTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 40)
        messageTextField.autoPinEdge(.top, to: .top, of: loginBackgrounds, withOffset: 70)
      


//        subtitleTextField.autoPinEdge(.top, to: .bottom, of: messageTextField, withOffset: 10)
        
        
        
        subtitleTextField.autoSetDimensions(to: CGSize(width: 100, height: 45))
        subtitleTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 40)
        subtitleTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 40)
        subtitleTextField.autoPinEdge(.top, to: .bottom, of: messageTextField, withOffset: 20)
        
//        datePicker.autoSetDimensions(to: CGSize(width: 100, height: 150))
        datePicker.autoPinEdge(toSuperviewEdge: .left, withInset: 40)
//        datePicker.autoPinEdge(toSuperviewEdge: .right, withInset: 40)
        datePicker.autoPinEdge(.top, to: .bottom, of: subtitleTextField, withOffset: 20)
        
        remindButton.autoSetDimensions(to: CGSize(width: 80, height: datePicker.bounds.height))
        remindButton.autoPinEdge(.left, to: .right, of: datePicker, withOffset: 40)
        remindButton.autoPinEdge(.right, to: .right, of: subtitleTextField)
        remindButton.autoPinEdge(.top, to: .bottom, of: subtitleTextField, withOffset: 20)



    }
    lazy var messageTextField : UITextField = {
        let messageTextField = UITextField.newAutoLayout()
        messageTextField.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1/1)
        
        messageTextField.layer.cornerRadius = 10
        messageTextField.textAlignment = .center

        return messageTextField
    }()
    lazy var subtitleTextField : UITextField = {
        let subtitleTextField = UITextField.newAutoLayout()
        subtitleTextField.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1/1)
        
        subtitleTextField.layer.cornerRadius = 10
        subtitleTextField.textAlignment = .center
        return subtitleTextField
    }()
    lazy var remindButton : UIButton = {
        
        let remindButton = UIButton.newAutoLayout()
        remindButton.setTitle("Remind", for: .normal)
        
        remindButton.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1/1)
        remindButton.layer.cornerRadius = 10
        return remindButton
        
    }()

    lazy var datePicker : UIDatePicker = {
        let datePicker = UIDatePicker.newAutoLayout()
        datePicker.accessibilityContainerType = .dataTable
        return datePicker
    }()
    lazy var loginBackgrounds : UIView = {
        let view = UIView.newAutoLayout()
        return view
    }()
    
}
