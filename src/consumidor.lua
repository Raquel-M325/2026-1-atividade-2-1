local Buffer = require("buffer")

Consumo = {
    item = nil
}

function Consumo:setConsumidor()
    self.item = nil
end

function Consumo:consumirItem()
    self.item = Buffer:remove()
    return self.item
end

function Consumo:consumidor()
    while true do
        local item = self:consumirItem()

        if item ~= nil then
            local fila_str = "[" .. table.concat(Buffer.queue, ", ") .. "]"
            print("[Consumidor] consumiu  " .. string.format("%3d", item) .. " | buffer=" .. fila_str)
        else
            print("Buffer vazio.")
        end

        coroutine.yield()
    end
end