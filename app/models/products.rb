class Products
    # model page for products.

  include ActiveModel::Model

  attr_accessor :id, :name, :brand_id, :brand

  @@products = []
  @@id_counter = 1

  def initialize(attributes = {})
    super(attributes)
    @id = @@id_counter
    @@id_counter += 1
  end

  def self.all
    @@products
  end

  def self.find(id)
    @@products.find { |product| product.id == id.to_i }
  end

  def save
    @@products << self
  end

  def update(attributes)
    self.attributes = attributes
  end

  def destroy
    @@products.delete(self)
  end
end
