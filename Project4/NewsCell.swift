//
//  AppDelegate.swift
//  Project4 TV News App
//
//  Created by Eric Palumbo on 08/021/2019.
//  Copyright © 2019 Eric Palumbo. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    @IBOutlet var imageView: RemoteImageView!
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var unfocusedConstraint: NSLayoutConstraint!
    var focusedConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        focusedConstraint = textLabel.topAnchor.constraint(equalTo: imageView.focusedFrameGuide.bottomAnchor, constant: 15)
    }

    override func updateConstraints() {
        super.updateConstraints()

        focusedConstraint.isActive = isFocused
        unfocusedConstraint.isActive = !isFocused
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        setNeedsUpdateConstraints()

        coordinator.addCoordinatedAnimations({
            self.layoutIfNeeded()
        })
    }
}
