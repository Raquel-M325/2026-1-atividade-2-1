local Buffer = {
    queue = {},      -- Tabela que armazenará os itens
    max_size = 5     -- Capacidade máxima do buffer (ajuste como preferir)
}

-- Função para adicionar um item ao buffer (usada pelo Produtor)
function Buffer:add(item)
    if #self.queue < self.max_size then
        table.insert(self.queue, item) -- Adiciona no final da fila
        print("[Buffer] Item " .. item .. " armazenado. Total atual: " .. #self.queue .. "/" .. self.max_size)
        return true
    else
        -- Em um cenário real com semáforos/threads, aqui o produtor bloquearia.
        -- Para uma simulação simples, vamos apenas avisar que está cheio.
        print("[Buffer Alerta] Buffer CHEIO! Não foi possível adicionar o item: " .. item)
        return false
    end
end

-- Função para remover um item do buffer (será usada pelo Consumidor)
function Buffer:remove()
    if #self.queue > 0 then
        local item = table.remove(self.queue, 1) -- Remove o primeiro da fila (FIFO)
        --print("[Buffer] Item " .. item .. " consumido. Total atual: " .. #self.queue .. "/" .. self.max_size)
        return item
    else
        --print("[Buffer Alerta] Buffer VAZIO! Nada para consumir.")
        return nil
    end
end

-- Retorna o módulo para ser usado via require("buffer")
return Buffer