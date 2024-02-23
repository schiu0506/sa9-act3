class Flower
    attr_reader :name, :price
    
    def initialize(name, price)
        @name = name
        @price = price
    end
end
  
class Customer
    attr_reader :name, :wallet
    
    def initialize(name, wallet)
      @name = name
      @wallet = wallet
    end
    
    def purchase(flower)
        if @wallet >= flower.price
            @wallet -= flower.price
            puts "#{@name} purchased a #{flower.name} for $#{flower.price}."
        else
            puts "Sorry, #{@name}, you don't have enough money to purchase the #{flower.name}."
        end
    end
end

class Shopkeeper
    attr_reader :name
        
    def initialize(name)
        @name = name
    end

    def sell(flower,customer)
        customer.purchase(flower)
    end
end