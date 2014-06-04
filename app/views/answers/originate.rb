def fib_number(n, first=0, second=1)
  if second >= n
    p n
  else
    fib_number(n, second, first+second)
    p second
  end
end

def fib_me(n)
  fib_array = [0,1]
  until fib_array.last >= n
    fib_array.push(fib_array[-1] + fib_array[-2])
  end
  return fib_array
end

def remove_non_char(string)
  string.gsub(/\s/, '')
end

remove_non_char