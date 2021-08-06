//
//  MGCheckStrongPassword.swift
//  Mon Chemin de Vie
//
//  Created by raphael maguet on 06/08/2021.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import CoreGraphics
import SwiftUI



class MGCheckStrongPassword: UIViewController, UIApplicationDelegate {
    
    var flagCount: Bool = false
    var flagCap: Bool = false
    var flagLow: Bool = false
    var flagDigit: Bool = false
    var flagSpec: Bool = false
    var progressLevel: Float = 0.0
    
    func capTest(getString: String) -> Bool {
        let capTest = NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*")
        return capTest.evaluate(with: getString)
    }
    
    func lowTest(getString: String) -> Bool {
        let lowTest = NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*")
        return lowTest.evaluate(with: getString)
    }
    
    func digitTest(getString: String) -> Bool {
        let digitTest = NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*")
        return digitTest.evaluate(with: getString)
    }
    
    func specTest(getString: String) -> Bool {
        let specialTest = NSPredicate(format:"SELF MATCHES %@", ".*[$@$#!%*?&]+.*")
        return specialTest.evaluate(with: getString)
    }
    
    func countTest(getString: String, getCount: Int) -> Bool {
        if getString.count > getCount {
            return true
        } else {
            return false
        }
    }
    
    func setColor(getValue: Float) -> UIColor {
        switch getValue {
            case _ where getValue <= 0.0 && getValue < 0.2:
                return UIColor(Color.black)
            case _ where getValue >= 0.2 && getValue < 0.4:
                return UIColor(Color.blue)
            case _ where getValue >= 0.4 && getValue < 0.6:
                return UIColor(Color.red)
            case _ where getValue >= 0.6 && getValue < 0.8:
                return UIColor(Color.orange)
            case _ where getValue >= 0.8 && getValue < 1.0:
                return UIColor(Color.yellow)
            case _ where getValue >= 1.0:
                return UIColor(Color.green)
            default:
                return UIColor(Color.green)
        }
    }
    
    func setValueProgress(getState: Bool) -> Float {
        
        if getState {
            progressLevel += 0.2
        } else {
            progressLevel -= 0.2
        }
        return progressLevel
    }
    
    func MGSetStrongPwd(getCount: Int, getTextField: UITextField, getProgress: UIProgressView) {
        let getStringText = getTextField.text
        if getStringText != "" {
            if countTest(getString: getStringText!, getCount: getCount) {
                if !flagCount {
                    flagCount = true
                    progressLevel = setValueProgress(getState: flagCount)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            } else {
                if flagCount {
                    flagCount = false
                    progressLevel = setValueProgress(getState: flagCount)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            }
            
            if capTest(getString: getStringText!) {
                if !flagCap {
                    flagCap = true
                    progressLevel = setValueProgress(getState: flagCap)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            } else {
                if flagCap {
                    flagCap = false
                    progressLevel = setValueProgress(getState: flagCap)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            }
            
            if lowTest(getString: getStringText!) {
                if !flagLow {
                    flagLow = true
                    progressLevel = setValueProgress(getState: flagLow)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            } else {
                if flagLow {
                    flagLow = false
                    progressLevel = setValueProgress(getState: flagLow)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            }
            
            if digitTest(getString: getStringText!) {
                if !flagDigit {
                    flagDigit = true
                    progressLevel = setValueProgress(getState: flagDigit)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            } else {
                if flagDigit {
                    flagDigit = false
                    progressLevel = setValueProgress(getState: flagDigit)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            }
            
            if specTest(getString: getStringText!) {
                if !flagSpec {
                    flagSpec = true
                    progressLevel = setValueProgress(getState: flagSpec)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            } else {
                if flagSpec {
                    flagSpec = false
                    progressLevel = setValueProgress(getState: flagSpec)
                    getProgress.tintColor = setColor(getValue: progressLevel)
                    getProgress.setProgress(progressLevel, animated: true)
                }
            }
            
        } else {
            flagCount = false
            flagCap = false
            flagLow = false
            flagDigit = false
            flagSpec = false
            progressLevel = 0.0
            getProgress.tintColor = UIColor(Color.clear)
            getProgress.setProgress(progressLevel, animated: true)
        }
        
    }
}
