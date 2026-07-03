local Buffer = require("buffer")
require("produtor")
require("consumidor")

Producao:setProduct()
Consumo:setConsumidor()

local co_produtor = coroutine.create(function()
    Producao:produtor()
end)

local co_consumidor = coroutine.create(function()
    Consumo:consumidor()
end)

math.randomseed(os.time())

print("Iniciando Exemplo 3 - Produtor e Consumidor...")
print("Pressione Ctrl+C para encerrar.\n")

for ciclo = 1, 30 do
    print("--- Ciclo " .. ciclo .. " ---")
    
    local sorteio = math.random(1, 10)
    
    if sorteio <= 6 then
        if #Buffer.queue < Buffer.max_size then
            assert(coroutine.resume(co_produtor))
        else
            print("[Semáforo] Produtor bloqueado. O buffer está cheio.")
        end
    else
        if #Buffer.queue > 0 then
            assert(coroutine.resume(co_consumidor))
        else
            print("[Semáforo] Consumidor bloqueado. O buffer está vazio.")
        end
    end
    
    os.execute("sleep 0.5")
    print("")
end

print("Exemplo 3 - Produtor e Consumidor finalizado.")