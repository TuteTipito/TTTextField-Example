//
//  TTTextField.swift
//  TTTextField Example
//
//  Created by Matías Spinelli on 29/5/18.
//  Copyright © 2018 Dalmunc. All rights reserved.
//

import UIKit

enum TextFieldType {
    case email
    case phone
    case dni
    case password
    case date
    case other
}

@IBDesignable
public class TTTextField: UIView, UITextFieldDelegate {

    @IBInspectable var padding :CGFloat = 10.0
    @IBInspectable public private(set) var linearColor : UIColor = UIColor.blue

    @IBOutlet weak var floatingLabel : UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var linearView: UIView!
    @IBOutlet weak var activeLinearView: UIView!
    @IBOutlet weak var activeLinearWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageLabel: UILabel!
        
//    private let nibName = "TTTextField"
//    private var contentView: UIView?
    @IBOutlet weak var view : UIView!

    override init(frame : CGRect) {
        super.init(frame : frame)
        commonInit()
        initialSetters()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
        initialSetters()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        initialSetters()
    }
    
    private func commonInit() {
        guard self.view == nil else { return }
        guard let view = loadViewFromNib() else { return }
//        guard self.view == nil else { return }
//        Bundle.main.loadNibNamed("TTTextField", owner: self, options: nil)
//        self.view.frame = self.bounds
//        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.addSubview(self.view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        self.view = view
    }

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TTTextField", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
//        return Bundle.main.loadNibNamed("TTTextField", owner: self, options: nil)?.first as? UIView
    }
    
    private func initialSetters() {
        self.textField.delegate = self
        self.textField.tintColor = linearColor
        self.linearView.backgroundColor = UIColor.gray
        self.activeLinearView.backgroundColor = linearColor
        self.messageLabel.textColor = linearColor
        self.floatingLabel.textColor = linearColor
        self.messageLabel.text = ""
        self.floatingLabel.text = self.textField.placeholder
        self.floatingLabel.isHidden = true
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()

    }
    
    //MARK: - Setters
    
    func set(linearColor : UIColor) {
        self.linearColor = linearColor
        self.activeLinearView.backgroundColor = linearColor
        self.textField.tintColor = linearColor
        self.activeLinearView.backgroundColor = linearColor
        self.messageLabel.textColor = linearColor
        self.floatingLabel.textColor = linearColor
    }
    
    //MARK: - Padding
    
    func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: (self.textField.leftView?.frame.size.width ?? 0)+self.padding, bottom: 0, right: (self.textField.rightView?.frame.size.width ?? 0)+self.padding);
        return bounds.inset(by: padding)
    }
    
    func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds:bounds)
    }
    
    func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds:bounds)
    }
    
    //MARK: - UITextFieldDelegate
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1.0) {
            self.activeLinearView.frame.size.width = self.linearView.frame.width
            self.activeLinearWidthConstraint.constant = self.activeLinearView.frame.size.width
            self.floatingLabel.isHidden = false
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField){
        validateInput()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Actions
    
    func setLeftViewWithImage(image: UIImage) {
        let imageView = UIImageView.init(image: image)
        self.textField.leftViewMode = .always
        self.textField.leftView = imageView
    }
    
    //MARK: - Private
    
    private func validateInput() {
        if textField.text != "" {
//            self.activeLinearView.frame.size.width = self.linearView.frame.width
//            self.activeLinearWidthConstraint.constant = self.activeLinearView.frame.size.width
            self.activeLinearView.backgroundColor = UIColor.red
            self.messageLabel.text = "Se ha producido un error... grave grave error... pero muy grave eh... que quilombo se armo..."
            self.messageLabel.textColor = UIColor.red
        } else {
            self.messageLabel.text = ""
            UIView.animate(withDuration: 1.0) {
                self.activeLinearView.frame.size.width = 0.0
                self.activeLinearWidthConstraint.constant = 0.0
            }
        }
    }
    
}
