class Brands
  # model page for brands. In this app there is no database.It works on models. 
  include ActiveModel::Model

  attr_accessor :id, :name, :products

  @@brands = []
  @@id_counter = 1

  def initialize(attributes = {})
    super(attributes)
    @id = @@id_counter
    @@id_counter += 1
  end

  def self.all
    @@brands
  end

  def self.find(id)
    @@brands.find { |brand| brand.id == id.to_i }
  end

  def save
    @@brands << self
  end

  def update(attributes)
    self.attributes = attributes
  end

  def destroy
    @@brands.delete(self)
  end
end
