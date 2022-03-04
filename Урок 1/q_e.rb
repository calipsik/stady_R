puts 'Введите коэффициент a'
a = gets.chomp.to_i
puts 'Введите коэффициент b'
b = gets.chomp.to_i
puts 'Введите коэффициент c'
c = gets.chomp.to_i
d = b**2-4*a*c
if d < 0
   puts "D = #{d}, Корней нет"
elsif d == 0
  puts "D = #{d}, x = #{-b/(2 * a)}" #Здесь D - дискриминант, x - корень
else
  puts "D = #{d}, x1 = #{(-b + Math.sqrt(d))/(2 * a)}"
  puts "x2 = #{(-b - Math.sqrt(d))/(2 * a)}"
end