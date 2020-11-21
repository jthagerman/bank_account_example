class Account

  attr_reader :name,:balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance 

  end

  private def pin
    @pin = 1234

  end

  private def pin_error
    return "Access denied: incorrect PIN."
  end

  def display_balance(pin_number)
    pin_number == pin ? puts( "Balance: $#{@balance}.") : puts(pin_error)
  end


  def withdraw(pin_number, amount)

    if(pin_number == pin)
      if(@balance - amount < 0)
        puts("WARNING! YOU ARE OVERDRAFTING YOU FOOL.")
      else
        @balance -= amount
         puts("Withdrew #{amount}. New balance: $#{@balance}.")
      end
    else
      puts pin_error
    end
  end


  def deposit(pin_number, amount)
    if(pin_number == pin)
      if(amount < 0)
        puts("cannot deposit a negative amount")
      else
       @balance += amount
      end
    else
     puts pin_error
    end
  end

  def print(pin_number=0)
    pin_number == pin ? puts(@balance) : puts(pin_error)
  end
end


x = Account.new("john")
x.display_balance(1234)
x.withdraw(1234, 101)
x.deposit(1234, 100000000)
x.print
x.print(1234)

checking_account = Account.new("bill", 234234.23)