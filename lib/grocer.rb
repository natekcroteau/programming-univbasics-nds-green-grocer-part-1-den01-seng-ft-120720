require 'pry'

def find_item_by_name_in_collection(name, collection)  #accepts two arguments

  collection.find do |cart_item|                    #iterate over the array of hashes with a representing each hash
  return cart_item if cart_item[:item] == name      #for each hash check if :item is equal to the argued name, if true return the hash

 end
end 




def consolidate_cart(cart)    #accepts AoH 
checkout_cart = []            #empty array to add hashes to after consolidating

  cart.each do |cart_item|                                                    #argued array of hashes is iterated over at each hash level 
    current_item = find_item_by_name_in_collection(cart_item[:item], checkout_cart)    #first method finds the item using the argued hash
    if current_item                                           #and the return array, then assigned to current_item variable. If true then 
      checkout_cart.each do |cons_cart_item|                                                       #look at each hash of the return array 
        if cons_cart_item[:item] == current_item[:item]                             #if that hash item matches the found item on line 18
          cons_cart_item[:count] +=1                                                #then add 1 to count(new key for hash)
        end 
      end
    else
      cart_item[:count] = 1                                     #if 21 isn't true, assign count key to hash and = 1 
      checkout_cart << cart_item                                #then add it to the checkout_cart array which is returned
  end 
 end 
end

