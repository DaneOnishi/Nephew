//
//  ScoresRepository.swift
//  Nephew
//
//  Created by Daniella Onishi on 12/12/21.
//


import Foundation

class ScoresRepository {
    static let shared = ScoresRepository()
    let UNLOCKED_CHARGES_KEY = "UNLOCKED_CHARGES_KEY"
    
    private func getUnlockedChargesFromDefaults() -> [Charges: Bool]? {
        let userDefaults = UserDefaults.standard
        if let data = userDefaults.object(forKey: UNLOCKED_CHARGES_KEY) as? Data {
            let intDict = try! JSONDecoder().decode( [Int:Bool].self, from: data)
            var chargesDict: [Charges: Bool] = [:]
            intDict.keys.forEach({ key in
               chargesDict[Charges(rawValue: key)!] = intDict[key]
            })
            return chargesDict
        }
        return nil
    }
    
    private func updateUnlockedChargesInDefaults(unlockedCharges: [Charges: Bool]) {
        let userDefaults = UserDefaults.standard
        var intDict: [Int: Bool] = [:]
        unlockedCharges.keys.forEach({ key in
           intDict[key.rawValue] = unlockedCharges[key]
        })
        let encodedDictionary = try? JSONEncoder().encode(intDict)
        userDefaults.set(encodedDictionary, forKey: UNLOCKED_CHARGES_KEY)
    }
    
    func GETTTTTTTTTTTTTTTTUnlockedChages() -> [Charges: Bool]{
        if let unlockedCharges = getUnlockedChargesFromDefaults() {
            return unlockedCharges
        }
        
        return [
            .EternalNephew: true,
            .Junior: false,
            .Pleno: false,
            .Senior: false]
    }
    
    func unlockCharge(charge: Charges) {
        var currentCharges = GETTTTTTTTTTTTTTTTUnlockedChages()
        currentCharges[charge] = true
        // salvar no udzinho
        updateUnlockedChargesInDefaults(unlockedCharges: currentCharges)
    }
}
