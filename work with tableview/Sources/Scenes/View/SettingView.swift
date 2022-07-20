//
//  SettingView.swift
//  work with tableview
//
//  Created by t h a . m a m e rozz on 20.07.22.
//

import UIKit

class SettingView: UIView{
    lazy var  tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(SettingTableViewCell.self,
                           forCellReuseIdentifier: SettingTableViewCell.indentifier)
        tableView.register(SwitchTableViewCells.self,
                           forCellReuseIdentifier: SwitchTableViewCells.indentifier)
        
        return tableView
    }()
    
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        addSubview(tableView)
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
