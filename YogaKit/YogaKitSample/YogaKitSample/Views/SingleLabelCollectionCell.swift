
import UIKit

final class SingleLabelCollectionCell: UICollectionViewCell {
    lazy var label: UILabel = {
        let l = UILabel(frame: .zero)
        l.numberOfLines = 1
        l.textAlignment = .center
        l.backgroundColor = .clear
        self.contentView.addSubview(l)
        
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = self.contentView.bounds
    }
}
