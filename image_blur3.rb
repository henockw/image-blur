class Image
  attr_accessor :rows

  def initialize(rows) 
     @rows = rows
     @one_locations = []
  end

  def blur_image(distance) 
    distance.times do
      transform
    end
  end

  def blur
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
          # If the value of the row_index, column_index = 1, then push into list of one locations
        if @rows[row_index][column_index] == 1
          @one_locations << [row_index, column_index]
        end
      end
    end

    @one_locations.each_with_index do |location|
      row_index = location[0]
      column_index = location[1] 

      if row_index != 0 # WE CAN MODIFY TOP
        @rows[row_index-1][column_index]= 1 
      end

      if column_index != @rows[row_index].length - 1
          # We can modify right
        @rows[row_index][column_index+1]=1 
      end

      if row_index != @rows.length - 1
          # We can modify bottom
        @rows[row_index+1][column_index]= 1
      end

      if column_index != 0
          # We can modify left
        @rows[row_index][column_index-1]=1
      end
    end
  end

  def transform
    @one_locations = []
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        if column == 1
          @one_locations << [row_index, column_index]
        end
      end
    end
    blur
  end

  def output_image
    @rows.each_with_index do |row, row_index|
      puts row.join('')
    end
  end
end


 i = Image.new([ 
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 1, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

i.blur_image(3)
i.output_image