import random

test = 'test'
test2 = 'test2'

a = random.sample(range(0, 50), 25)
b = random.sample(range(0, 50), 25)
c = [x for x in a if x in b]

print(sorted(a))
print(sorted(b))
print(sorted(c))
