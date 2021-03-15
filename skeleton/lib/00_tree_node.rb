require "byebug"

class PolyTreeNode


    attr_reader :value, :parent, :children

    def initialize(value=0, children = [])
        @value = value
        @parent = nil
        @children = children
    end 

    def parent=(node)
        # node.parent.children.delete(node)
        return if self.parent == node
        if self.parent
            self.parent.children.delete(self)
        end
        @parent = node 

        self.parent.children << self unless self.parent.nil?
        # if !@parent.children.include?(self)
        #     @parent.children << self
        # end
        # if !@parent.children.empty?
        #     @parent.children.delete(self)
        # end\
        # 
        # @parent.children.shift
        self
    end 

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "Tried to remove node that isn't a child"
          end
        child.parent = nil 
        
        # raise "Error" if self.parent == node.parent
           
    end

    def inspect
        {   
            value: @value,
            parent: @parent.value,
            children: @children.map {|ele| ele.value}
        }.to_s
        # [value, children]

    end
end

class Searchable

    def dfs(target_val)
        debugger
        #if the val @ node = target_val then return node
        return self if self.value == target_val

    end

end