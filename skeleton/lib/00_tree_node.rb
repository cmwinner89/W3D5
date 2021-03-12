class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value=0)
        @value = value
        @parent = nil
        @children = []
    end 

    def parent=(node)
        @parent = node 
        self.children << 
    end 

    def add_child

    end
end