class User < ApplicationRecord
    
    validate :unique_name_within_limit, on: :create

    private
  
    def unique_name_within_limit
      if User.where(name: name).exists?
        errors.add(:name, "must be unique")
      end
  
      if User.count >= 6
        errors.add(:base, "User limit (6) has been reached.")
      end
    end    
    after_create :display
    def display 
        puts("You have crete an object!")
    end
end
