require("buffer")

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

        print("Produzido: " .. item)
        os.execute("sleep 1")

    end
end