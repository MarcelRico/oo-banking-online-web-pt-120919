class BankAccount
  
  attr_reader :name
  attr_accessor :balance,:status

  def initialize(account_name)
    @name = account_name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount_to_deposit)
    @balance += amount_to_deposit
  end

  def display_balance
   "Your balance is $#{@balance}."
  end
  
  def valid?
    (@balance > 0) && (@status == "open")
  end
  
  def close_account
    @status = "closed"
  end

end
