
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelRandomNumber: UILabel!
    @IBOutlet weak var labelTextResult: UILabel!
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var buttonStatus: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelRandomNumber.text = "???"
        labelTextResult.text = "Компьютер случайным образом загадал число от 0 до 200. Попробуй его отгадать! Введи своё число и нажмите Check."
        buttonStatus.isEnabled = false
        labelRandomNumber.backgroundColor = .systemGray6
        labelTextField.text = ""
        
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        guard let x = labelTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !x.isEmpty,
              Int(x) != nil
        else {
            buttonStatus.isEnabled = false
            return
        }
        buttonStatus.isEnabled = true
    }
    
    var randomNumber =  Int.random(in: 1...200)
    
    @IBAction func pressBtn(_ sender: UIButton) {
        let userNumber = Int(labelTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines))!
        switch userNumber {
        case let i where i == randomNumber:
            labelTextResult.text = "Cупер, Вы угадали!"
            labelRandomNumber.text = String(randomNumber)
            labelRandomNumber.backgroundColor = .systemGreen
            buttonStatus.isEnabled = false
        case let i where i > 200:
            labelTextResult.text = "Вы ввели некорректное число. Ваше число должно быть в диапазоне от 0 до 200. Попробуйте снова"
        case let i where i > randomNumber:
            labelTextResult.text = "Ваше число больше загаданного"
        case let i where i < randomNumber:
            labelTextResult.text = "Ваше число меньше загаданного"
        default:
            labelTextResult.text = "Вы не угадали"
        }
        labelTextField.text = ""
        buttonStatus.isEnabled = false
    }
    
    @IBAction func presscube(_ sender: UIButton) {
        viewDidLoad()
        randomNumber = Int.random(in: 1...200)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
