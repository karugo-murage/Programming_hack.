def solution(a)
    # write your code in Ruby 2.
    all_numbers = 1...1000
    all_numbers.map do |i| 
        if puts a.include? i == false
            puts i
        end
    end
  
end

solution([2,4,5,6,7])

# function solution(A) {
#   for (i = 1; i < 1000000; i++) {
#     if(!A.includes(i)) return i;
#   }
# }