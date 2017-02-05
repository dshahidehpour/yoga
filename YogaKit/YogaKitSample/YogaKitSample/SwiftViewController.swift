/**
 * Copyright 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE-examples file in the root directory of this source tree.
 */

import UIKit
import IGListKit
import YogaKit

struct DemoItem {
    let name: String
}

final class SwiftViewController: UIViewController, IGListAdapterDataSource {
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "YogaKit Examples"
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    
    //MARK: IGListAdapterDataSource
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return ["Dustin" as IGListDiffable, "Ryan" as IGListDiffable]
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        let sizeBlock: IGListSingleSectionCellSizeBlock = { (model, context) in
            return CGSize(width: (context?.containerSize.width)!, height: 100.0)
        }
        let configureBlock: IGListSingleSectionCellConfigureBlock = { (model, cell) in
            guard let m = model as? String else {
                return
            }
            
            cell.backgroundColor = (m == "Dustin") ? .blue : .red
        }
        
        return IGListSingleSectionController(cellClass: UICollectionViewCell.self,
                                             configureBlock: configureBlock,
                                             sizeBlock: sizeBlock)
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
    
//  override func viewDidLoad() {
//    let root = self.view!
//    root.backgroundColor = .red
//    root.yoga.isEnabled = true
//    root.yoga.width = self.view.bounds.size.width
//    root.yoga.height = self.view.bounds.size.height
//    root.yoga.alignItems = .center
//    root.yoga.justifyContent = .center
//
//    let child1 = UIView()
//    child1.backgroundColor = .blue
//    child1.yoga.isEnabled = true
//    child1.yoga.width = 100
//    child1.yoga.height = 10
//
//    let child2 = UIView()
//    child2.backgroundColor = .green
//    child2.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//
//    let child3 = UIView()
//    child3.backgroundColor = .yellow
//    child3.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//
//    child2.addSubview(child3)
//    root.addSubview(child1)
//    root.addSubview(child2)
//    root.yoga.applyLayout()
//  }
}
