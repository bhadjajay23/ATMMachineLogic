//
//  ViewController.swift
//  Demo
//
//  Created by Jay on 09/05/20.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

class ATMMachineLogic: UIViewController {

    // you can changes note count
    var notecount2000 = 4
    var notecount500 = 1
    var notecount200 = 2
    var notecount100 = 10

    var totalBankBalance = 100000
    var yourEnteredAmount = 9000
    var notesarray = [2000, 500, 200, 100]
    var totalnotes : [Int] = []
    var currentCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (yourEnteredAmount <= totalBankBalance) {
            recursivefun()
            print("Total notes list :", totalnotes)
            print("Total Rs:", totalnotes.reduce(0, +))
            print("2000 Notes Count: ", notecount2000)
            print("500 Notes Count: ", notecount500)
            print("200 Notes Count: ", notecount200)
            print("100 Notes Count: ", notecount100)

        } else {
            print("Bank does not have enough money")
        }
    }

    func getCount(currentnote: Int) -> Int {
        currentCount = 0
        switch (currentnote) {
            case 2000:
                currentCount = notecount2000
            case 500:
                currentCount = notecount500
            case 200:
                currentCount = notecount200
            case 100:
                currentCount = notecount100
            default: break
        }
        return currentCount
    }
    
    func decreaseNoteCount(note : Int, usedNote: Int) {
        switch (note) {
        case 2000:
            notecount2000 = notecount2000 - usedNote
            break
        case 500:
            notecount500 = notecount500 - usedNote
            break
        case 200:
            notecount200 = notecount200 - usedNote
            break
        case 100:
            notecount100 = notecount100 - usedNote
            break
        default:
            break
        }
    }
    
    func totalNotes(usedNoteCount: Int, amout: Int) {
        for _ in 0..<usedNoteCount {
            self.totalnotes.append(amout)
        }
    }
     
    func recursivefun() {
        var remainingAmount : Int = yourEnteredAmount
        for i in 0..<notesarray.count {
            if (totalnotes.reduce(0, +) < yourEnteredAmount) {
                if remainingAmount >= notesarray[i] {
                    let currentnoteCount = getCount(currentnote: notesarray[i])
                    let usedNoteCount = remainingAmount / notesarray[i]
                    if usedNoteCount <= currentnoteCount {
                        remainingAmount = remainingAmount % notesarray[i]
                        decreaseNoteCount(note: notesarray[i], usedNote: usedNoteCount)
                        totalNotes(usedNoteCount: usedNoteCount, amout: notesarray[i])
                    } else {
                        remainingAmount = remainingAmount - (currentnoteCount * notesarray[i])
                        decreaseNoteCount(note: notesarray[i], usedNote: currentnoteCount)
                        totalNotes(usedNoteCount: currentnoteCount, amout: notesarray[i])
                    }
                }
            }
        }
    }
}

