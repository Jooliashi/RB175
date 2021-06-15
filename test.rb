require 'pry'
def find_even_index(arr)
  arr.each_with_index do |idx|
    binding.pry
    p idx
    if idx - 1 == 0 || idx - 1 == arr.length - 1
      return idx if arr.sum == 0
    elsif arr[0...idx-1].sum == arr[idx..-1].sum
      return idx 
    end
  end 
  -1
end

find_even_index([1,2,3,4,3,2,1])