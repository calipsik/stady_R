fibonacci=[0,1]
while (fibonacci.last+fibonacci[fibonacci.count-2])<100
  fibonacci<<fibonacci.last+fibonacci[fibonacci.count-2]
end
puts fibonacci