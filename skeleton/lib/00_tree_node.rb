require "byebug"

class PolyTreeNode


    attr_reader :value, :parent, :children

    def initialize(value=0, children = [])
        @value = value
        @parent = nil
        @children = children
    end 

    def parent=(node)
        @parent = node 
        @parent.children << self
    end 

    def add_child(child)
        child.parent = self
    end

    def remove_child(node)
        node.parent = self
    end
end