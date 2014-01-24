require 'csv'

class Item

  class << self
    attr_reader :filename, :items
  end

  # I'd like to be able to have Item parse a CSV and give me an array
  # without having it store them after parsing (ie I can do what I want with them)
  # or I can parse it again to look at something without affecting the set
  # of loaded items
  def self.parse(filename)
    @items = load_data(filename)
  end

  def self.count
    items.length
  end

  def self.reset
    @items = []
  end

  def self.add(item_input)    
    @items << Item.new(item_input)
  end


  def self.find_by_id(id_input)
    find_by :id, id_input
  end

  def self.find_by_description(description_input)
    find_by :description, description_input
  end

  def self.find_by_merchant_id(merchant_id_input)
    find_by :merchant_id, merchant_id_input
  end

  def self.find_by_unit_price(unit_price_input)
    find_by :unit_price, unit_price_input
  end

  def self.find_by_created_at(created_at_input)
    find_by :created_at, created_at_input
  end

  def self.find_by_updated_at(updated_at_input)
    find_by :updated_at, updated_at_input   
  end

  def self.find_all_by_name(name_input)
    find_all_by :name, name_input
  end

  def self.find_all_by_description(description_input)
    find_all_by :description, description_input
  end

  def self.find_all_by_unit_price(unit_price_input)
    find_all_by :unit_price, unit_price_input
  end

  def self.find_all_by_merchant_id(merchant_id_input)
    find_all_by :merchant_id, merchant_id_input
  end

  def merchant
    # return merchant instance
    Merchant.find_by_id(:merchant_id)
  end

  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize attributes
    @id = attributes[:id].to_i
    @name = attributes[:name]
    @description = attributes[:description]
    @unit_price = attributes[:unit_price].to_f
    @merchant_id = attributes[:merchant_id].to_i
    @created_at = Time.parse(attributes[:created_at])
    @updated_at = Time.parse(attributes[:updated_at])
  end

  private

  def self.load_data(filename)
    data(filename).map { |row| Item.new(row) }
  end

  def self.data(filename)
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def self.find_by field, value
    self.items.find{ |item|  item.send(field.to_sym) == value }
  end

  def self.find_all_by field, value
    self.items.select{ |item|  item.send(field.to_sym) == value }
  end

end

