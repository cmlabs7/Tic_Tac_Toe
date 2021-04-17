class Player
    attr_accessor :name, :sym

    def initialize(name, sym = "")
        @name = name
        @sym = sym
    end

    def symbol
        @sym
    end

end