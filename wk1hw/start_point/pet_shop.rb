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
      return pet
    end
  end
  return nil
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

def sell_pet_to_customer(pet_shop, pet, customer)
  # Check if the oet_name varied is a hash and not nil.
  if pet.is_a? Hash
    # Check if the customer can afford the pet.
      if customer_can_afford_pet(customer, pet)
        # Remove the cost of the pet from customer.
        remove_customer_cash(customer, pet[:price])
        # Add the pet hash to the customer.
        add_pet_to_customer(customer, pet)
        # Increase the pets that have been sold by shop.
        increase_pets_sold(pet_shop, 1)
        # Alter the cash that the store has.
        add_or_remove_cash(pet_shop, pet[:price])
        # Remove the pet from the pet shop after sold.
        remove_pet_by_name(pet_shop, pet)
      end
  end
end
