class ItemParser

  attr_reader :filename, :items

  def parse(filename)
    @filename=filename
    @items=load_data
  end


  private

  def load_data
    data.map { |row| Person.new(row) }
  end

  def data
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

end