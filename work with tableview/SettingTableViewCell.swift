//
//  SettingTableViewCell.swift
//  work with tableview
//
//  Created by t h a . m a m e rozz on 13.06.2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
// MARK: - Views
    private let iconContainer: UIView = {
        let view = UIView()
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
// MARK: - Properties
    static let indentifier = "SettingTableViewCell"
    
// MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Override methods
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
