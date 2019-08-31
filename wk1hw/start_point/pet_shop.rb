def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_pets_sold)
  pet_shop[:admin][:pets_sold] += num_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, pet_breed)
  pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == pet_breed
      pets.push(pet)
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      name_of_pet = pet
    end
  end
  return name_of_pet
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  customer[:pets].length()
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  if pet[:price] > customer[:cash]
    return false
  else
    return true
  end
end

def sell_pet_to_customer(pet_shop, pet_name, customer)
  # This is terrible coding i think but it passes the first test....
  if customer_can_afford_pet(customer, pet_name)
    remove_customer_cash(customer, pet_name[:price])
    add_pet_to_customer(customer, pet_name)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet_name[:price])
  end
end

# Attempt 1
#
# for pet in pet_shop[:pets]
#   if find_pet_by_name(pet_shop, pet_name)
#     if customer_can_afford_pet(customer, pet_name)
#       remove_customer_cash(customer, pet_name[:price])
#       add_pet_to_customer(customer, pet_name)
#       increase_pets_sold(pet_shop[:admin][:pet_sold], 1)
#       add_or_remove_cash(pet_shop, pet_name[:price])
#     end
#   end
# end

# Attemp 2
#
# sold_pet = []
# for pet in pet_shop[:pets]
#   if pet[:name] == pet_name
#     sold_pet.push(pet)
#     return sold_pet
#   end
# end
# return sold_pet
# if customer_can_afford_pet(customer, sold_pet[:price])
#   add_pet_to_customer(customer, sold_pet)
# end
