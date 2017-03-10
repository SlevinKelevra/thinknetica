f = 0
f1 = 0
f2 = 1
arr = [f1, f2]
 while f < 89 do
  f = f1 + f2
  arr << f
   f1 = f2
   f2 = f
 end
 puts arr
