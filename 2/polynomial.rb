# Z - is a polynoom value on the each step, pow is a current value of the raised variable
# The coefficients are entered in the order of ascending powers
z,t,a,pow = 0,0,0,1
print "t -> "
t = gets.to_i
begin
  while true
    print "a -> "
    a = readline.to_i # To handle exception
    z+=a*pow
    pow*=t
    puts "P(t) = #{z}"
  end
  rescue EOFError
    puts "\n"
end
