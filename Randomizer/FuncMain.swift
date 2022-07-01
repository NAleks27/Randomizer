//
//  FuncMain.swift
//  Randomizer
//
//  Created by Aleksey Nosik on 23.06.2022.
//

import Foundation

class RandomNumber {

    let randomNumber = UInt8.random(in: 1...20)
    print("Компьютер случайным образом загадал число от 0 до 250. Попробуй его отгадать!")

    var isWin = false
    print("Введите своё число и нажмите Enter.")

    repeat {
        guard let userNumber = UInt8(readLine() ?? "") else {
            print("Вы ввели некорректное число. Ваше число должно быть в диапазоне от 0 до 50. Попробуйте снова")
        continue }
        
        switch userNumber {
             case let i where i == randomNumber:
                print("Cупер, Вы угадали!")
                isWin = true
             case let i where i > randomNumber:
                print("Ваше число больше загаданного")
             case let i where i < randomNumber:
                print("Ваше число меньше загаданного")
             default: print("Вы не угадали")
        }
    } while !isWin

}
