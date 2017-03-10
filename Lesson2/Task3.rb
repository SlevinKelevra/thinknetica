
f1 = 0
f2 = 1
arr = [f1, f2]
 while f1 < 89 do
  f1 = f1 + f2
  arr << f1
   f1 = f2
   f2 = f1
 end
 puts arr
