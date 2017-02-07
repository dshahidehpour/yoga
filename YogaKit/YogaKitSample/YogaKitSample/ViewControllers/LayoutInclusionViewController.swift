/**
 * Copyright 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE-examples file in the root directory of this source tree.
 */

import UIKit
import YogaKit

final class LayoutInclusionViewController: UIViewController {
    override func viewDidLoad() {
        let root = self.view!
        root.backgroundColor = .white
        root.yoga.isEnabled = true
        root.yoga.flexDirection = .column
        root.yoga.justifyContent = .spaceAround
        root.layer.borderWidth = 1.0
        root.layer.borderColor = UIColor.red.cgColor
        
        let v = UIView(frame: .zero)
        v.backgroundColor = .blue
        v.yoga.isEnabled = true
        v.yoga.height = 300
        v.yoga.width = self.view.bounds.size.width
        root.addSubview(v)

        let button = UIButton(type: .system)
        button.setTitle("Add Blue View", for: .normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: UIControlEvents.touchUpInside)
        button.yoga.isEnabled = true
        button.yoga.alignSelf = .center
        root.addSubview(button)
        
        root.yoga.applyLayout()
    }
    
    // MARK - UIButton Action
    
    func buttonWasTapped() {
        self.view!.yoga.applyLayout()
    }
}
