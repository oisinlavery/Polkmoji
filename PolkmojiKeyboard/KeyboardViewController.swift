//
//  KeyboardViewController.swift
//  PolkmojiKeyboard
//
//  Created by Oisín Lavery on 11/7/15.
//  Copyright © 2015 Oisín Lavery. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

//    @IBOutlet var nextKeyboardButton: UIButton!

    var image: UIImage!
    var imageButton = UIButton(type: .Custom)
    var nextKeyboardButton = UIButton(type: .Custom)
    var pasteboard = UIPasteboard.generalPasteboard()

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        image = UIImage(named: "polkmoji")!

        view.backgroundColor = UIColor(red:0.933, green:0.933, blue:0.933, alpha: 1)

        view.addSubview(imageButton)
        imageButton.addTarget(self, action: "imageTapped:", forControlEvents: .TouchUpInside)
        imageButton.setImage(image, forState: .Normal)
        imageButton.adjustsImageWhenHighlighted = false
        imageButton.translatesAutoresizingMaskIntoConstraints = false

        let verticalConstraint = NSLayoutConstraint(item: imageButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)

        let horizontalConstraint = NSLayoutConstraint(item: imageButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0)

        view.addConstraints([verticalConstraint, horizontalConstraint])


        view.addSubview(nextKeyboardButton)

        nextKeyboardButton.setImage(UIImage(named: "ic_close_black"), forState: .Normal)
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        nextKeyboardButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        nextKeyboardButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
        nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false

        let nextKeyboardButtonTopConstraint = NSLayoutConstraint(item: nextKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 0)

        let nextKeyboardButtonTrailingConstraint = NSLayoutConstraint(item: nextKeyboardButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)

        view.addConstraints([nextKeyboardButtonTopConstraint, nextKeyboardButtonTrailingConstraint])

    }

    func imageTapped(sender:UIButton) {
//        self.textDocumentProxy.insertText("Polk rules!")

        pasteboard.image = image!

        let rotateAnimation = CASpringAnimation(keyPath: "transform.rotation")
        rotateAnimation.damping = 5
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = rotateAnimation.settlingDuration
        self.imageButton.layer.addAnimation(rotateAnimation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

}
