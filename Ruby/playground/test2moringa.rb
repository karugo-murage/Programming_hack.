def solution(a, b)
    n = a.length
    m = b.length
    a = a.sort
    b = b.sort
    i = 0
    numbers = []
    non_conformative = []
    for k in 0 .. n - 1
        if i < m - 1 and b[i] < a[k]
            i += 1
        end
        if a[k] == b[i]
            numbers << a[k]
        end
    end
    if numbers.length == 0
        puts -1
    end
        puts numbers[0]
end

solution([13,3,5,1,7,6], [5,5,12,13])
