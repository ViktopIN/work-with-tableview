//
//  Models.swift
//  work with tableview
//
//  Created by t h a . m a m e rozz on 18.07.22.
//

import UIKit.UIImage

struct GeneralSection {
    private let general = Section(title: "General", option: [
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
        
    ])
    
     private let notification = Section(title: "Notification", option: [
        .staticCell(model: SettingsOptions(title: "Уведомления",
                                           icon: UIImage(systemName: "speaker.wave.3"),
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
                                               print("Нажата ячейка Экранное время")
                                           })
    ])
    
    private let mainSettings = Section(title: "Main settings", option: [
        .staticCell(model: SettingsOptions(title: "Основные",
                                           icon: UIImage(systemName: "gear"),
                                           iconBackgroundColor: .lightGray){
                                               print("Нажата ячейка Основные")
                                           }),
        .staticCell(model: SettingsOptions(title: "Пункты управления",
                                           icon: UIImage(systemName: "switch.2"),
                                           iconBackgroundColor: .lightGray){
                                               print("Нажата ячейка Пункты управления")
                                           }),
        .staticCell(model: SettingsOptions(title: "Экран и яркость",
                                           icon: UIImage(systemName: "textformat.size"),
                                           iconBackgroundColor: .link){
                                               print("Нажата ячейка Экран и яркость")
                                           }),
        .staticCell(model: SettingsOptions(title: "Экран \u{0022}Домой\u{0022}",
                                           icon: UIImage(named: "icons"),
                                           iconBackgroundColor: .blue){
                                               print("Нажата ячейка Экран \u{0022}Домой\u{0022}")
                                           }),
        .staticCell(model: SettingsOptions(title: "Универсальный доступ",
                                           icon: UIImage(systemName: "person.circle"),
                                           iconBackgroundColor: .link){
                                               print("Нажата ячейка Универсальный доступ")
                                           })
    ])
    
    func get() -> [Section] {
        let sectionArray = [general, notification, mainSettings]
        
        return sectionArray
    }
}
