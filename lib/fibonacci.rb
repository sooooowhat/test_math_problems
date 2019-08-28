def f n
  n > 2 ? f(n-1) + f(n-2) : 1
end


def fib_fast(n, mem = {})
  return n if n == 0 || n == 1
  mem[n] ||= fib_fast(n-1, mem) + fib_fast(n-2, mem)
end
