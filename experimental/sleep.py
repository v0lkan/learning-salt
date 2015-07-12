module test:
  def sleep(length):
    time.sleep(int(length))
    return True
  
  def fib(num):
    num = int(num)
    start = time.time()
    fib_a, fib_b = 0, 1
    ret = [0]
    
    while fib_b < num:
      ret.append(fib_b)
      fib_a, fib_b = fib_b, fib_a + fib_b
    
    return ret, time.time() - start