class Image
  def initialize(rows)
    @rows = rows
    @one_locations = []
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
      # Modify Neighbors
      # top - row index == 0 , you cannot change above
      # right -column_index === row.length - 1, you cannot change right
      # bottom = row_index === @rows.length - 1, you cannot change bottom
      # left = column_index == 0, you cannot change left

      if row_index != 0
        # WE CAN MODIFY TOP
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

    # @rows.each_with_index do |row, row_index|
    #   row.each_with_index do |cell, column_index|
    #     blur_location(row_index,column_index)
    #   end
    # end
    # @rows = @rows_copy
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
# 0. Iterate through all of the grid
# 1. Find the ones - [x,y] [x,y] [x,y]
# 2. Iterate through all of the ones identified
# 3. For each one => change top, change bottom, change right, change left
# 4. Know in which directions changes can happen
# 5. Make the modifications




# image.blur
# image.output_image


# [3,1]
# top - [2,1]
# right - [3,2]
# bottom - [4,1]
# left - [3, 0]


# top - row index == 0 , you cannot change above
# right -column_index === row.length - 1, you cannot change right
# bottom = row_index === @rows.length - 1, you cannot change bottom
# left = column_index == 0, you cannot change left