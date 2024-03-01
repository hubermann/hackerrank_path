
#Escribir una funcion que reciba un array de valores: positivos, negativos y cero.

# arr = [1, 1, 0, -1, -1]

# Hay 5 valores, 2 positivos, un cero, y dos negativos
# el calculo debe ser:
# 2/5, 2/5 y 1/5 todos eso valroe a float


def plusMinus(arr)
    pos = 0
    neg = 0
    neu = 0

    arr.each do |e|
        if e > 0 
            pos += 1
        elsif e == 0
            neu += 1
        else
            neg += 1
        end
    end

    puts pos.to_f / arr.length
    puts neg.to_f / arr.length
    puts neu.to_f / arr.length
            
end

valores = [-4, 3, -9, 0, 4, 1]

plusMinus(valores)



