
# FizzBuzz


#Se le entraentrega a la funcion un array de enteros 
# Si un numero es divisible por 3 y por 5 imprime: FizzBuzz
# Si es divisible por 3: Fizz
# Si es divisible por 5: Buzz
# sino, el valor.


def fizzBuzz(n)
    (1..n).each do |v|
        if ((v % 3 == 0) && (v % 5 == 0))
            puts "FizzBuzz"
        elsif (v % 3 == 0)
            puts "Fizz"
        elsif (v % 5 == 0)
            puts "Buzz"
        else
            puts v
        end
    end 
end

