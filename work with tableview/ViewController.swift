//
//  ViewController.swift
//  work with tableview
//
//  Created by t h a . m a m e rozz on 13.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: - Views
    var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(SettingTableViewCell.self,
                           forCellReuseIdentifier: SettingTableViewCell.indentifier)
        tableView.register(SwitchTableViewCells.self,
                           forCellReuseIdentifier: SwitchTableViewCells.indentifier)
        
        return tableView
    }()
    
// MARK: - Properties
    var model = GeneralSection().get()
    
// MARK: - Settings
    private func setupHierarchy() {
        
        view.addSubview(tableView)
    }
    
    private func setupView() {
        
        tableView.frame = view.bounds
    }
    
    private func setupLayout() {
      
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        
        setupHierarchy()
        setupView()
        setupLayout()
        
        configurationTableView()
    }
}
// MARK: - Extensions & Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configurationTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].option.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.indentifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCells.indentifier,
                for: indexPath
            ) as? SwitchTableViewCells else {
                return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.configure(with: model)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = model[indexPath.section].option[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(model: let model):
            model.handler()
        }
    }
}
