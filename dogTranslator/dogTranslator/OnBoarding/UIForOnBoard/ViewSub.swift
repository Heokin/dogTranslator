//
//  ViewSub.swift
//  dogTranslator
//
//  Created by Stas Dashkevich on 21.12.22.
//

import Foundation
import UIKit

class ViewSub: UIView {
    
    enum ViewType {
        case segmentView
        case imagePlace
        case drawPlace
        case circle
        case contentMode
        case line
        case subscribeSubView
        case subscribeSubViewPlace
        case dismissView
        case disperse
        case settingView
        case ads
    }
    
    init(type: ViewType) {
        
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .ads:
            backgroundColor = .clear
            leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            heightAnchor.constraint(equalToConstant: 50).isActive = true
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        case .segmentView:
            backgroundColor = UIColor(named: "backgroundScale")
            layer.cornerRadius = 2
            if UIScreen.main.bounds.width > 830 {
                heightAnchor.constraint(equalToConstant: 18).isActive = true
                widthAnchor.constraint(equalToConstant: 210).isActive = true
            } else if UIScreen.main.bounds.width > 500 && UIScreen.main.bounds.width < 830 {
                heightAnchor.constraint(equalToConstant: 16).isActive = true
                widthAnchor.constraint(equalToConstant: 180).isActive = true
            } else {
                heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/101.5).isActive = true
                widthAnchor.constraint(equalToConstant: 80).isActive = true
            }
        case .imagePlace:
            backgroundColor = .clear
            heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2.852).isActive = true
            widthAnchor.constraint(equalToConstant: 120).isActive = true
        case .circle:
            backgroundColor = UIColor(named: "orange")
            layer.cornerRadius = UIScreen.main.bounds.width / 6
        case .drawPlace:
            backgroundColor = .black
            heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.43).isActive = true
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        case .contentMode:
            backgroundColor = UIColor(named: "backgroundScale")
        case .line:
            backgroundColor = .white
        case .subscribeSubView:
            backgroundColor = .white
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 2.0
            if UIScreen.main.bounds.height > 800 {
                layer.cornerRadius = 15
            } else {
                layer.cornerRadius = 32
            }
        case .subscribeSubViewPlace:
            backgroundColor = UIColor(named: "Bounty")
            layer.borderWidth = 2.0
            layer.borderColor = UIColor.black.cgColor
            layer.cornerRadius = 16
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .dismissView:
            backgroundColor = .clear
            widthAnchor.constraint(equalToConstant: 110).isActive = true
            heightAnchor.constraint(equalToConstant: 40).isActive = true
        case .disperse:
            backgroundColor = UIColor(red: 0.855, green: 0.518, blue: 0.2, alpha: 0.15)
            layer.borderWidth = 0.5
            layer.borderColor = UIColor(named: "orange")!.cgColor
        case .settingView:
            backgroundColor = UIColor(named: "orange")
            widthAnchor.constraint(equalToConstant: 30).isActive = true
            heightAnchor.constraint(equalToConstant: 30).isActive = true
            layer.cornerRadius = 7
            layer.masksToBounds = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = point
    }
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        addSubview(border)
    }
}

extension UIView {

    func removeConstraints() { removeConstraints(constraints) }
    func deactivateAllConstraints() { NSLayoutConstraint.deactivate(getAllConstraints()) }
    func getAllSubviews() -> [UIView] { return UIView.getAllSubviews(view: self) }

    func getAllConstraints() -> [NSLayoutConstraint] {
        var subviewsConstraints = getAllSubviews().flatMap { $0.constraints }
        if let superview = self.superview {
            subviewsConstraints += superview.constraints.compactMap { (constraint) -> NSLayoutConstraint? in
                if let view = constraint.firstItem as? UIView, view == self { return constraint }
                return nil
            }
        }
        return subviewsConstraints + constraints
    }

    class func getAllSubviews(view: UIView) -> [UIView] {
        return view.subviews.flatMap { [$0] + getAllSubviews(view: $0) }
    }
}
