//
//  SettingsViewController.swift
//  Marco Polo
//
//  Created by Justin Oakes on 18/12/17.
//  Copyright © 2017 Oklasoft LLC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var themePickerTextfield: PickerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themePickerTextfield.picker.delegate = self
        themePickerTextfield.picker.dataSource = self
        switch theme() {
        case .standard:
            themePickerTextfield.picker.selectRow(0, inComponent: 0, animated: false)
            themePickerTextfield.text = NSLocalizedString("Default", comment: "Default")
            break
        case .spaceGrey:
            themePickerTextfield.picker.selectRow(1, inComponent: 0, animated: false)
            themePickerTextfield.text = NSLocalizedString("Space Gray", comment: "Space Gray")
            break
        case .silver:
            themePickerTextfield.picker.selectRow(2, inComponent: 0, animated: false)
            themePickerTextfield.text = NSLocalizedString("Silver", comment: "Silver")
            break
        case .gold:
            themePickerTextfield.picker.selectRow(3, inComponent: 0, animated: false)
            themePickerTextfield.text = NSLocalizedString("Gold", comment: "Gold")
            break
        case .roseGold:
            themePickerTextfield.picker.selectRow(4, inComponent: 0, animated: false)
            themePickerTextfield.text = NSLocalizedString("Rose Gold", comment: "Rose Gold")
            break
        }
        UserDefaults.standard.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissSelf(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func theme() -> themes {
        guard let theme: themes = themes(rawValue: UserDefaults.standard.string(forKey: "theme") ?? "")
            else {
                return .standard
        }
        return theme
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return NSLocalizedString("Default", comment: "Default")
        case 1:
            return NSLocalizedString("Space Gray", comment: "Space Gray")
        case 2:
            return NSLocalizedString("Silver", comment: "Sliver")
        case 3:
            return NSLocalizedString("Gold", comment: "Gold")
        case 4:
            return NSLocalizedString("Rose Gold", comment: "Rose Gold")
        default:
            return NSLocalizedString("Default", comment: "Default")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            themePickerTextfield.text = NSLocalizedString("Default", comment: "Default")
            UserDefaults.standard.set(themes.standard.rawValue, forKey: "theme")
            break
        case 1:
            themePickerTextfield.text = NSLocalizedString("Space Gray", comment: "Space Gray")
            UserDefaults.standard.set(themes.spaceGrey.rawValue, forKey: "theme")
            break
        case 2:
            themePickerTextfield.text = NSLocalizedString("Silver", comment: "Sliver")
            UserDefaults.standard.set(themes.silver.rawValue, forKey: "theme")
            break
        case 3:
            themePickerTextfield.text = NSLocalizedString("Gold", comment: "Gold")
            UserDefaults.standard.set(themes.gold.rawValue, forKey: "theme")
            break
        case 4:
            themePickerTextfield.text = NSLocalizedString("Rose Gold", comment: "Rose Gold")
            UserDefaults.standard.set(themes.roseGold.rawValue, forKey: "theme")
            break
        default:
            themePickerTextfield.text = NSLocalizedString("Default", comment: "Default")
            UserDefaults.standard.set(themes.standard.rawValue, forKey: "theme")
        }
        
    }
}

enum themes: String {
    typealias RawValue = String
    
    case standard = ""
    case spaceGrey = "spaceGrey"
    case silver = "silver"
    case gold = "gold"
    case roseGold = "roseGold"
}
