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
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
    
        return tableView
    }()
    
// MARK: - Properties
    var model = [SettingsOptions]()
    
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
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        cell.textLabel?.text = model.title
    
        return cell
    }
    
    func configure() {
        self.model = Array(0...20).compactMap {
            SettingsOptions(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                
            }
        }
    }
}
