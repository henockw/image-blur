class Image
  def initialize(rows)
    @rows = rows
    @one_locations = []
  end

  def blur
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        if @rows[row_index][column_index] == 1
          @one_locations << [row_index, column_index]
        end
      end
    end


    @one_locations.each_with_index do |location|
      row_index = location[0]
      column_index = location[1]

      if row_index != 0
        @rows[row_index-1][column_index]= 1 
      end

      if column_index != @rows[row_index].length - 1
        @rows[row_index][column_index+1]=1 
      end

      if row_index != @rows.length - 1
        @rows[row_index+1][column_index]= 1
      end

      if column_index != 0
        @rows[row_index][column_index-1]=1
      end
    end 
  end
  
  def output_image
    @rows.each_with_index do |row, row_index|
      puts row.join('')
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0],
])

image.blur
image.output_image