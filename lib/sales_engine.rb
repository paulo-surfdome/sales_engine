require_relative '../lib/item'

class SalesEngine

  def initialize

  end

  def startup
    # File.expand_path '../../data/items.csv', __FILE__
    # /Users/jose/Desktop/ruby-course/sales_engine/lib/item.rb/../../data/items.csv
    # /Users/jose/Desktop/ruby-course/sales_engine/data/items.csv
    Item.parse('data/items.csv')

  end


end