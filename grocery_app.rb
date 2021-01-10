
# Arrays of items and an empty cart for the end user to put items into
@store_items = [
  { item: 'apple', price: 1 },
  { item: 'milk', price: 5 }
]

@user_cart = []

# Here is a menu I created that will call out to other methods depending on where they choose to go

def main_menu
  puts "********************************************************"
  puts 'Welcome to our grocery store! Select an option:'
  puts '1) Add items to cart'
  puts '2) View items in cart'
  puts '3) Remove items from cart'
  puts '4) View total amount'
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

    puts "Thank you if you want to add another item select 1 again"
    puts "********************************************************"

    main_menu
end

main_menu