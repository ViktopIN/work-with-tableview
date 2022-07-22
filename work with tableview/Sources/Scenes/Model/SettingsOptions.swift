//
//  SettingsOptions.swift
//  work with tableview
//
//  Created by t h a . m a m e rozz on 13.06.2022.
//

import UIKit

struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct Section {
    let title: String
    let option: [SettingsOptionsType]
}

enum SettingsOptionsType {
    case staticCell(model: SettingsOptions)
    case switchCell(model: SettingSwitchOption)
}
