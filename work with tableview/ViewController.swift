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
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.configure(with: model)
            return cell
        }
    }
    
    func configure() {
        self.model.append(Section(title: "General", option: [
            .switchCell(model: SettingSwitchOption(title: "Авиарежим",
                                                   icon: UIImage(systemName: "airplane"),
                                                   iconBackgroundColor: .systemOrange,
                                                   handler: {},
                                                   isOn: true)),
            .staticCell(model: SettingsOptions(title: "WI-FI",
                                               icon: UIImage(systemName: "wifi"),
                                               iconBackgroundColor: .link){
                                                   print("Нажата ячейка WI-FI")
                                               }),
            .staticCell(model: SettingsOptions(title: "Bluetooth",
                                               icon: UIImage(named: "bluetooth"),
                                               iconBackgroundColor: .link){
                                                   print("Нажата ячейка Bluetooth")
                                               }),
            .staticCell(model: SettingsOptions(title: "Сотовая связь",
                                               icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                                               iconBackgroundColor: .systemGreen){
                                                   print("Нажата ячейка сотовая связь")
                                               }),
            .staticCell(model: SettingsOptions(title: "Режим модема",
                                               icon: UIImage(systemName: "personalhotspot"),
                                               iconBackgroundColor: .systemGreen){
                                                   print("Нажата ячейка режим модема")
                                               }),
            .switchCell(model: SettingSwitchOption(title: "VPN",
                                                   icon: UIImage(named: "vpn"),
                                                   iconBackgroundColor: .link,
                                                   handler: {},
                                                   isOn: false))
            
        ]))
          
        self.model.append(Section(title: "Main settings", option: [
            .staticCell(model: SettingsOptions(title: "Основные настройки",
                                               icon: UIImage(systemName: "notification"),
                                               iconBackgroundColor: .red){
                                                   print("Нажата ячейка уведомления")
                                               }),
            .staticCell(model: SettingsOptions(title: "Звуки, тактильные сигналы",
                                               icon: UIImage(named: "sound"),
                                               iconBackgroundColor: .systemPink){
                                                   print("Нажата ячейка Звуки, тактильные сигналы")
                                               }),
            .staticCell(model: SettingsOptions(title: "Не беспокоить",
                                               icon: UIImage(systemName: "moon.fill"),
                                               iconBackgroundColor: .systemPurple){
                                                   print("Нажата ячейка Не беспокоить")
                                               }),
            .staticCell(model: SettingsOptions(title: "Экранное время",
                                               icon: UIImage(systemName: "hourglass"),
                                               iconBackgroundColor: .red){
                                                   print("Экранное время")
                                               })
        ]))
    }
    
    self.model.append(Section(title: "Notification", option: [
        .staticCell(model: SettingsOptions(title: "Уведомления",
                                           icon: UIImage(named: "notification"),
                                           iconBackgroundColor: .red){
                                               print("Нажата ячейка уведомления")
                                           }),
        .staticCell(model: SettingsOptions(title: "Звуки, тактильные сигналы",
                                           icon: UIImage(named: "sound"),
                                           iconBackgroundColor: .systemPink){
                                               print("Нажата ячейка Звуки, тактильные сигналы")
                                           }),
        .staticCell(model: SettingsOptions(title: "Не беспокоить",
                                           icon: UIImage(systemName: "moon.fill"),
                                           iconBackgroundColor: .systemPurple){
                                               print("Нажата ячейка Не беспокоить")
                                           }),
        .staticCell(model: SettingsOptions(title: "Экранное время",
                                           icon: UIImage(systemName: "hourglass"),
                                           iconBackgroundColor: .red){
                                               print("Экранное время")
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

