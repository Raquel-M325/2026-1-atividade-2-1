local Buffer = require("buffer")

Producao = {
    item = 0
}

function Producao:setProduct()
    self.item = 0
end

function Producao:produzirItem()
    self.item = self.item + 1
    return self.item
end

function Producao:produtor()
    while true do
        local item = self:produzirItem()

        Buffer:add(item) --adiciona na espera/carrinho

        local fila_str = "[" .. table.concat(Buffer.queue, ", ") .. "]"
        print("[Produtor] produziu  " .. string.format("%3d", item) .. " | buffer=" .. fila_str)
        coroutine.yield()

    end
end