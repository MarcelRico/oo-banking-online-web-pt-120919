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
  
  def execute_transaction(sender = @sender, receiver = @receiver, completion_status = "complete")
    
    status_is_pending = (@status == "pending")
    insufficent_funds = (sender.balance - @amount <= 0)
    accounts_not_closed = (sender.status == "open") && (receiver.status == "open")
    all_validation_passes = status_is_pending && !insufficent_funds && accounts_not_closed && self.valid?
    
    if all_validation_passes
      sender.balance -= @amount
      receiver.balance += @amount
      @status = completion_status
    elsif !accounts_not_closed || insufficent_funds
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    
  end
  
  def reverse_transfer
    if @status = "completed"
      @status = "pending"
      self.execute_transaction(@receiver, @sender, "reversed")
    end
  end
  
end
