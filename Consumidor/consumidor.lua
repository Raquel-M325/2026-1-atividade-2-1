require("buffer")

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
            print("Consumido: " .. item)
        else
            print("Buffer vazio.")
        end

        os.execute("sleep 1")
    end
end