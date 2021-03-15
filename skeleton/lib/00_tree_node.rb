require "byebug"

module Searchable

    def dfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target}

        return self if prc.call(self)

        children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end 
        nil
    end 

    def bfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new {|node| node.value == target}

        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if prc.call(node)
            nodes.concat(node.children)
        end 
        nil
    end 

end


class PolyTreeNode
    # include Searchable


    attr_reader :parent, :children
    attr_accessor :value 

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