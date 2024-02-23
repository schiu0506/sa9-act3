require_relative 'flower_shop'

RSpec.describe Flower do
    describe "#initialize" do
        it "creates a new flower with name and price" do
            flower = Flower.new("Rose", 10)
            expect(flower.name).to eq("Rose")
            expect(flower.price).to eq(10)
        end
    end
end

RSpec.describe Customer do
    describe "#initialize" do
        it "creates a new customer with name and wallet" do
            customer = Customer.new("John Doe", 50)
            expect(customer.name).to eq("John Doe")
            expect(customer.wallet).to eq(50)
         end
    end

    describe "#purchase" do
        it "allows a customer to purchase a flower if they have enough money" do
            flower = Flower.new("Rose", 10)
            customer = Customer.new("John Doe", 15)
            expect { customer.purchase(flower) }.to output("John Doe purchased a Rose for $10.\n").to_stdout
            expect(customer.wallet).to eq(5)
        end

        it "does not allow a customer to purchase a flower if they don't have enough money" do
            flower = Flower.new("Rose", 10)
            customer = Customer.new("John Doe", 5)
            expect { customer.purchase(flower) }.to output("Sorry, John Doe, you don't have enough money to purchase the Rose.\n").to_stdout
            expect(customer.wallet).to eq(5)
        end
    end
end

RSpec.describe Shopkeeper do
    describe "#initialize" do
        it "creates a new shopkeeper with a name" do
            shopkeeper = Shopkeeper.new("Jane Smith")
            expect(shopkeeper.name).to eq("Jane Smith")
        end
    end
    
    describe "#sell" do
        it "allows a shopkeeper to sell a flower to a customer" do
            flower = Flower.new("Rose", 10)
            customer = Customer.new("John Doe", 20)
            shopkeeper = Shopkeeper.new("Jane Smith")
            expect { shopkeeper.sell(flower, customer) }.to output("John Doe purchased a Rose for $10.\n").to_stdout
            expect(customer.wallet).to eq(10)
        end
    end
end