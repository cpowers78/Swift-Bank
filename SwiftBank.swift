
struct SwiftBank{
  private let password : String
  init (password: String, initialDeposit: Double){
    self.password = password
    makeDeposit(ofAmount: initialDeposit)
  }
  private func isValid(_ enteredPassword: String) -> Bool{
    if enteredPassword == password{
      return true
    }else{
      return false
    }
  }
  private var balance: Double = 0{
    didSet {
      if balance < 100{
        displayLowBalanceMessage()
      }
    }
  }

  static let depositBonusRate = 0.01

  private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double{
    return deposit + (deposit * SwiftBank.depositBonusRate)
  }
  mutating func makeDeposit(ofAmount depositAmount: Double){
    let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
    print("Make a deposit of \(depositAmount) with a bonus rate. The final amount deposited is \(depositWithBonus)")
    balance += depositWithBonus
  }
  func displayBalance(usingPassword password: String){
    if !isValid(password){
      print("Error: Invalid password. Cannot retrieve balance.")
      return 
    }
    print("Your current balance is $\(balance)")

    }
    mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String){
      if !isValid(password){
        print("Error: Invalid password. Cannot make withdrawal.")
        return
      }
      balance -= withdrawalAmount
      print("Making a $ \(withdrawalAmount) withdrawal.")
    }
  private func displayLowBalanceMessage(){
    print("Alert: Your balance is under $100.")
  }
}

var myAccount = SwiftBank(password: "Caty45", initialDeposit: 650)
myAccount.makeDeposit(ofAmount: 50)
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "Caty45")
myAccount.displayBalance(usingPassword: "Caty45")

