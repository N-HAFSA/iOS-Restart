//for each char
//has  a number
// has >= 1 uppercase
// has >= 1 lowercase
// remover special char sem regex :/
//no consecutive numbers
// min char 5 max 15
//split 1st to be Uppercase
//
var existUppecase: Bool = false
var existLowerCase: Bool = false
var existNumber: Bool = false
var numNotConsecutive: Bool = true
var notASymbole: Bool = true
var index: Int = 0

enum state: String{
    case noUppecase = "First Letter Must Be Uppercase"
    case noLowerCase = "Lower case character needed"
    case noNumber = "still Need at least a Number"
    case numConsecutive = "Can't use cosecutive numbers"
    case symbole = "Ops! can't use special Characters 😔"
}

func checkFirstCharUppercased(_ givenPassword: String, _ password: inout String) {
    if let firstChar = givenPassword.first {
        if firstChar.isUppercase{
            password.remove(at: givenPassword.startIndex)
            existUppecase = true
            return
        }
    }
    print(state.noUppecase.rawValue)
}

func checkConsecutivity(_ password: String, _ char: Character) -> Bool{
    if(index < password.count){
        if let nextNum = password[password.index(password.startIndex, offsetBy: index)].wholeNumberValue {
            if char.wholeNumberValue ==  nextNum - 1  {
               return false
            }
        }
    }
    return true
}

func getState() {
    if existUppecase && existLowerCase && existNumber && numNotConsecutive && notASymbole {
        print("🥳 wohooow you're all set.")
    }
    else{
        if(existNumber){
            numNotConsecutive ? nil : print(state.numConsecutive.rawValue)
        }else{
            print(state.noNumber.rawValue)
        }
        existLowerCase ? nil : print(state.noLowerCase.rawValue)
        notASymbole ? nil : print(state.symbole.rawValue)
    }
}

func strongPassword(givenPassword: String){
    var password = givenPassword
    index = 0
    existUppecase = false
    existLowerCase = false
    existNumber = false
    numNotConsecutive = true
    notASymbole = true
    
    switch givenPassword.count {
    case 5...15 :
        checkFirstCharUppercased(givenPassword, &password)
        for char in password {
            index += 1
            if (char.isWholeNumber ){
                existNumber = true
                if(numNotConsecutive){
                    numNotConsecutive = checkConsecutivity(password, char)
                }
            }else if(char.isLetter){
                if(char.isLowercase){
                    existLowerCase = true
                }
            }
            else{
                notASymbole = false
            }
        }
        getState()
    //greater or equal to 15
    case 15... :
        print("you reach the max, hard to remember!")
        break
    case ...5:
        print("too short give it more!")
    default:
        break
    }
}

strongPassword(givenPassword: ")(MMMMM")
strongPassword(givenPassword: "Mundtr12543")
strongPassword(givenPassword: "yole1b2u4")
strongPassword(givenPassword: "Teudkfjb73y")
strongPassword(givenPassword: "yh46")
strongPassword(givenPassword: "Xman03648ybstnd45")


