class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    limit(5)       
  end

  def self.dinghy
    where("length < 20")
  end
  
  def self.ship
    where("length > 20")
  end

  def self.last_three_alphabetically
    order(:name).reverse_order.limit(3)
  end

  def self.without_a_captain    
    order(:captain_id).limit(2)
  end

  def self.sailboats    
    first.classifications.last.boats
  end

  def self.with_three_classifications
    # binding.pry
    joins(:boat_classifications).group(:boat_id).count
    
  end

  
end
