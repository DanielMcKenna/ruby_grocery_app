
# Arrays of items and an empty cart for the end user to put items into
@store_items = [
  { item: 'apple', price: 1 },
  { item: 'milk', price: 5 }
]

@user_cart = []

# Here is a menu I created that will call out to other methods depending on where they choose to go

def main_menu
  puts 'Welcome to our grocery store! Select an option:'
  puts '1) Add items to cart'
  puts '2) View items in cart'
  puts '3) Remove items from cart'
  puts '4) View total amount'
  puts '5) Add new items to the store'
  puts '6) exit'
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