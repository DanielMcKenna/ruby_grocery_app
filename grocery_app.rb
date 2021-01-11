
# Arrays of items and an empty cart for the end user to put items into
@store_items = [
  { item: 'apple', price: 1 },
  { item: 'milk', price: 3 },
  { item: 'sour watermelons', price: 8 },
  { item: 'chocolate', price: 13 }
]

@user_cart = []


# Here is a menu I created that will call out to other methods depending on where they choose to go
def user_dollar_amount
  puts "How much money are you willing to spend at the grocery store?"
  @user_money = gets.strip.to_i
  @user_string_money = @user_money.to_s
end

def main_menu
  puts "********************************************************"
  puts "Welcome to our grocery store! you have a total of #{@user_string_money}.00 to spend. Select an option:"
  puts '1) Add items to cart'
  puts '2) View items in cart'
  puts '3) Remove items from cart'
  puts '4) Check Out'
  puts '5) Add new items to the store'
  puts '6) exit'
  puts "********************************************************"
  menu_input = gets.strip.to_i

  if menu_input == 1
    add_item_to_cart
  elsif menu_input == 2
    view_all_items
  elsif menu_input == 3
    delete_item
  elsif menu_input == 4
    total_cost
  elsif menu_input == 5
    add_item_store
  elsif menu_input == 6
    exit
  else
    puts 'invalid entry, try again'
    main_menu
  end
end
# This is a method I created that takes an item from the store items and put it in your cart

def add_item_to_cart
  puts "What would you like to add to your cart?"
# Here it grabs a list of everything in store items
  @store_items.each_with_index do |product, index|
    puts "#{index + 1}: #{product[:item]} - $#{product[:price]}.00"
  end
# user chooses the item by number and i minus one so the computer grabs that index
    item_input = gets.strip.to_i - 1
    # this will take the index item the end user selected from the store items and push it to the user cart
    @user_cart << @store_items[item_input]

    puts "Would you like to add more products to your cart?"
    puts "1) Yes"
    puts "2) No"
    menu_input = gets.strip.to_i

    if menu_input == 1
      add_item_to_cart
    elsif menu_input == 2
      main_menu
    else
      puts "invalid input.... taking you back to the menu"
    end
end

def view_all_items
  puts "Here is a list of all the products in your cart"

  @user_cart.each_with_index do |product, index|
    puts "#{index + 1}: #{product[:item]} - $#{product[:price]}.00"
  end

  puts "Would you like to go back to the main menu?"
  puts "1) Yes"
  puts "2) No"
  menu_input = gets.strip.to_i
  
  if menu_input == 1
    main_menu
  elsif menu_input == 2
    view_all_items
  else
    puts "invalid entry... taking you back to the main menu"
    main_menu
  end

end

def delete_item
  puts "which product would you like to remove from your cart?"

  @user_cart.each_with_index do |product, index|
    puts "#{index + 1}: #{product[:item]} - $#{product[:price]}.00"
  end

  item_input = gets.strip.to_i - 1
  @user_cart.delete_at(item_input)

  puts "Do you want to remove another product from your cart or go to the main menu?"
  puts "1) Delete another item"
  puts "2) To go back to the main menu"
  menu_input = gets.strip.to_i

  if menu_input == 1
    delete_item
  elsif menu_input == 2
    main_menu
  else
    puts "invalid entry going back to main menu"
    main_menu
  end

end

def total_cost
  # puts "This is the user cart: #{@user_cart}"
  @checkout = []
  @user_cart.each do |food|
    # puts food[:price]
    @checkout << food[:price]
    # puts @checkout
  end
  @total = @checkout.sum
  if @total > @user_money
    puts "Sorry you do not have enough money Please remove some items or return to menu"
    puts "1) Remove product from cart?"
    puts "2) Return to main menu"
    menu_input = gets.strip.to_i

    if menu_input == 1
      delete_item
    elsif menu_input ==2
      main_menu
    else
      puts "invalid entry going back to main menu"
      main_menu
    end
  elsif @total <= @user_money
    @money_difference = @user_money - @total
    puts "Thank you for purchasing here you have a balance of #{@money_difference}.00 Thank you"
    main_menu
  else
    puts "error hehehe you found me"
    main_menu
  end

end

user_dollar_amount
main_menu