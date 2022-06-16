//
//  ViewController.swift
//  work with tableview
//
//  Created by t h a . m a m e rozz on 13.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    var model = [Section]()
    
// MARK: - Settings
    private func setupHierarchy() {
        
        view.addSubview(tableView)
    }
    
    private func setupLayout() {

    }
    
    private func setupView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        
        configure()
        
        setupHierarchy()
        setupLayout()
        setupView()
        
    }
    
// MARK: - Methods
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
            cell.configure(with: model)
            return cell
        }
    }
    
    func configure() {
        self.model.append(Section(title: "General", option: [
            .switchCell(model: SettingSwitchOption(title: "Airplane mode",
                                                   icon: UIImage(systemName: "airplane"),
                                                   iconBackgroundColor: .systemOrange,
                                                   handler: {
                                                       
                                                   },
                                                   isOn: true)),
            .staticCell(model: SettingsOptions(title: "Bluetooth",
                                               icon: UIImage(systemName: "bluetooth"),
                                               iconBackgroundColor: .link){
                                                   
                                               }),
            .staticCell(model: SettingsOptions(title: "ICloud",
                                               icon: UIImage(systemName: "cloud"),
                                               iconBackgroundColor: .red){
                                                   
                                               })
        ]))
          
        self.model.append(Section(title: "Information", option: [
            .staticCell(model: SettingsOptions(title: "Wifi",
                                               icon: UIImage(systemName: "wifi"),
                                               iconBackgroundColor: .systemPink){
                                                   print("Tapped fuck dope")
                                                   
                                               }),
            .staticCell(model: SettingsOptions(title: "AirplaneMode",
                                               icon: UIImage(systemName: "airplane"),
                                               iconBackgroundColor: .systemOrange){
                                                   
                                               }),
            .staticCell(model: SettingsOptions(title: "Bluetooth",
                                               icon: UIImage(systemName: "bluetooth"),
                                               iconBackgroundColor: .link){
                                                   
                                               }),
            .staticCell(model: SettingsOptions(title: "ICloud",
                                               icon: UIImage(systemName: "cloud"),
                                               iconBackgroundColor: .red){
                                                   
                                               })
        ]))
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

