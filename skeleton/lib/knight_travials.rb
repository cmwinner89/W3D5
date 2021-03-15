class KnightPathFinder
    attr_reader :pos
    
    def initialize(pos)
        @pos = pos
        
        build_move_tree
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(pos)
    end
end