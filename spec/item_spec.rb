require_relative 'spec_helper'
require_relative '../lib/item'

describe 'Item' do
  before do
    Item.reset
    Item.add({:id => 1, 
      :name => "Item Qui Esse", 
      :description => "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
      :unit_price => 75107,
      :merchant_id => 1,
      :created_at => "2012-03-27 14:53:59 UTC",
      :updated_at => "2012-03-27 14:53:59 UTC"
      })

   Item.add({:id => 2, 
      :name => "paulinho", 
      :description => "Nihil autem sit.",
      :unit_price => 1234,
      :merchant_id => 1,
      :created_at => "2012-03-28 14:53:59 UTC",
      :updated_at => "2012-03-28 18:53:59 UTC"
      })
  end

  let(:item1) { Item.find_by_id(1) }
  let(:item2) { Item.find_by_id(2) }

  context 'instances' do
    specify 'know their attributes' do
      expect(item1.id).to          eq(1)
      expect(item1.name).to        eq("Item Qui Esse")
      expect(item1.description).to eq("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
      expect(item1.unit_price).to  eq(75107)
      expect(item1.merchant_id).to eq(1)
      expect(item1.created_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))
      expect(item1.updated_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))
    end
  end

  context 'class' do
    it 'can query by id'
    it 'can query by name'
    # ...
    
    it 'loads the data and allows me to query it' do      
      item2 = Item.find_by_id(2)
      expect(item2.id).to          eq(2)

      # tests to add:
      # expect(Item.find_by_id(3)).to eq(nil)
      # 

      # find_by_description
      expect(Item.find_by_description(item1.description)).to eq(item1)
      expect(Item.find_by_description(item2.description)).to eq(item2)

      # is the same as find_all, show me that it omits things without that merchant_id
      # 
      items = Item.find_all_by_merchant_id(1)
      expect(items.size).to eq(2)
    end
  end
end