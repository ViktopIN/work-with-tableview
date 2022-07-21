//
//  ViewController.swift
//  work with tableview
//
//  Created by t h a . m a m e rozz on 13.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: - Views
    private var settingView: SettingView? {
        guard isViewLoaded else { return nil }
        return view as? SettingView
    }
    
// MARK: - Properties
    var model = GeneralSection().get()
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        
        configurationTableView()
    }
    
    override func loadView() {
        view = SettingView()
    }
}

// MARK: - Extensions & Methods
extension ViewController: UITableViewDataSource {
    
    func configurationTableView() {
        settingView?.tableView.delegate = self
        settingView?.tableView.dataSource = self
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
}
extension ViewController: UITableViewDelegate {
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
