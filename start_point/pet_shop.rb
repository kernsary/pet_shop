def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number_of_new_sales)
  shop[:admin][:pets_sold] += number_of_new_sales
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  pets_of_breed = []
  for pet in shop[:pets]
    if pet[:breed] == breed
      pets_of_breed << pet
    end
  end
  return pets_of_breed
end

def find_pet_by_name(shop, pet_name)
  for pet in shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop, pet_name)
  for pet in shop[:pets]
    if pet[:name] == pet_name
      shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, pet)
  if (pet != nil) && (customer_cash(customer) >= pet[:price])
    return true
  end
  return false
end

def sell_pet_to_customer(shop, pet, customer)
  can_customer_afford = customer_can_afford_pet(customer, pet)
  if (pet != nil) && (can_customer_afford == true)
    customer[:pets] << pet
    shop[:pets].delete(pet)
    customer[:cash] -= pet[:price]
    shop[:admin][:total_cash] += pet[:price]
    shop[:admin][:pets_sold] += 1
  end
end
