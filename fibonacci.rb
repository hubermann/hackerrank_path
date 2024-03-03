# In mathematics, the Fibonacci sequence is a sequence in which each number 
# is the sum of the two preceding ones.

# 0 1 1 2 3 5 8 13 21 34 55 89 144 ...

def fibonacci n
    resultado, traspaso = 0, 0
    puts anterior = 0
    n.times do |v|
        resultado = anterior + traspaso
        traspaso = anterior
        anterior == 0 ? anterior = 1 : anterior = resultado
        puts anterior
     end

end

fibonacci 15