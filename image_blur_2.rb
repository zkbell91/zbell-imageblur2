class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |pixel|
      puts pixel.join(" ")
    end
  end

  def create_index
    ones = []
    @data.each_with_index do |row, row_index|
      row.each_with_index do |pixel, col_index|
        ones << [row_index, col_index] if pixel == 1
      end
    end
    ones
  end


  def blur
    ones = create_index
    @data.each_with_index do |row, row_current|
      row.each_with_index do |pixel, col_current|
        ones.each do |indexed_row, indexed_col|
          if (row_current == indexed_row) && (col_current == indexed_col)
            @data[row_current - 1][col_current] = 1 unless row_current == 0
            @data[row_current + 1][col_current] = 1 if row_current < 5
            @data[row_current][col_current - 1] = 1 unless col_current == 0
            @data[row_current][col_current + 1] = 1 if col_current < 3            
          end
        end
      end
    end
    
  end


end

image = Image.new([
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0]
])


image.blur
image.output_image