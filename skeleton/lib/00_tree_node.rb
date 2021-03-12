class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value=0)
        @value = value
        @parent = nil
        @children = []
    end 

    def parent=(node)
        @parent = node 
        if !children.include?(self)
            add_child(self)
        end

    end 

    def add_child(node)
        #add child node into children array for parent
        @parent = node
        @parent.children << self
    end

    def remove_child(node)
       @parent = node 
    end
end