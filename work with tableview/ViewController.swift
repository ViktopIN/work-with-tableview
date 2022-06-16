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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.indentifier,
            for: indexPath
        ) as? SettingTableViewCell else {
            return UITableViewCell()
        }
    
        cell.configure(with: model)
        return cell
    }
    
    func configure() {
        self.model.append(Section(title: "General", option: [
            SettingsOptions(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemPink){
                print("Tapped fuck dope")
        },
            SettingsOptions(title: "AirplaneMode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange){
        },
            SettingsOptions(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
        },
            SettingsOptions(title: "ICloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .red){
        }]))
        
        self.model.append(Section(title: "Apps", option: [
            SettingsOptions(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemPink){
        },
            SettingsOptions(title: "AirplaneMode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange){
        },
            SettingsOptions(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
        },
            SettingsOptions(title: "ICloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .red){
        }]))
        
        self.model.append(Section(title: "Information", option: [
            SettingsOptions(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemPink){
        },
            SettingsOptions(title: "AirplaneMode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange){
        },
            SettingsOptions(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
        },
            SettingsOptions(title: "ICloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .red){
        }
        ]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = model[indexPath.section].option[indexPath.row]
        model.handler()
    }
}

