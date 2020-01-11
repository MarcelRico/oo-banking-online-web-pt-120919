class Transfer
  
  attr_accessor :sender,:receiver,:status,:amount
  
  def initialize(from_account,to_account,transfer_amount)
    @sender = from_account
    @receiver = to_account
    @status = "pending"
    @amount = transfer_amount
  end
  
  def valid?
    (@amount > 0) && (@sender.valid?) && (@receiver.valid?)
  end
  
  def execute_transaction
    
    status_is_pending = (@status == "pending")
    insufficent_funds = (@sender.balance <= @amount)
    accounts_not_closed = (@sender.status == "open") && (@receiver.status == "open")
    all_validation_passes = status_is_pending && !insufficent_funds && accounts_not_closed
    
    
    if all_validation_passes
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif insufficent_funds
      return "Hello World!"
    end
    
    puts "sender balance: #{@sender.balance}"
    puts "receiver balance: #{@receiver.balance}"
    
    
    
  end
end
