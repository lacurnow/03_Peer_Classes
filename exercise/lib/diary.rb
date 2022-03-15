# class Diary
#   def initialize(contents) # contents is a string
#     @contents = contents
#   end

#   def read
#     return @contents
#     # Returns the contents of the diary
#   end
# end

Diary = Struct.new(:contents) do
  def read
    return contents
  end
end