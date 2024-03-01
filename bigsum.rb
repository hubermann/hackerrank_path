

array = [1, 2, 3, 4, 5, 6, 10, 8, -12]

def diagonalDifference(arr)
    r2 = []
    r1 = []
    arr.each_with_index do |value, index|
        r1 << value if [0, 4, 5].include?(index)
        r2 << value if [2, 4, 6].include?(index)
    end
    r1.sum - r2.sum
end



puts diagonalDifference(array)