require './00_tree_node.rb'

class KnightPathFinder
    attr_reader :pos, :possible_moves
    attr_accessor :root_node, :considered_pos

    
    def self.valid_moves(pos)
        possible_moves = []

       if (pos[0] < 8 && pos[0] > 0) && (pos[1] < 8 && pos[1] > 0) 
            possible_moves << [pos[0] + 2, pos[1] + 1] if pos[0] + 2 <= 8 && pos[1] + 1 < 8
            possible_moves << [pos[0] + 1, pos[1] + 2] if pos[0] + 1 <= 8 && pos[1] + 2 < 8
            possible_moves << [pos[0] - 2, pos[1] - 1] if pos[0] - 2 >= 0 && pos[1] - 1 >= 0
            possible_moves << [pos[0] - 1, pos[1] - 2] if pos[0] - 1 >= 0 && pos[1] - 2 >= 0
            possible_moves << [pos[0] + 2, pos[1] - 1] if pos[0] + 2 <= 8 && pos[1] - 1 >= 0
            possible_moves << [pos[0] - 1, pos[1] + 2] if pos[0] - 1 >= 0 && pos[1] + 2 < 8
            possible_moves << [pos[0] + 1 , pos[1] - 2] if pos[0] + 1 <= 8 && pos[1] - 2 >= 0
            possible_moves << [pos[0] - 2, pos[1] + 1] if pos[0] - 2 >= 0 && pos[1] + 1 < 8
        end

        possible_moves 


        #give pos on board
        #return array of all legal chess moves
        #L in any direction #up to 8 but less if you're on edge of board
    end 
    
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_pos = [pos]
        # build_move_tree
    end

    def new_move_positions(pos)
    #     #filter down valid_moves and exclude places we've been before
    #     #keeping track of places we've visited
    #     #use in build move tree
    #     #instance variable 
        test_pos = KnightPathFinder.valid_moves(pos) 
        test_pos.each do |ele|
            @considered_pos << ele if !@considered_pos.include?(ele)
        end

        @considered_pos
        # @considered_pos.delete(pos)
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

    def build_move_tree
    #     # self.root_node = PolyTreeNode.new(pos)
    #     #use node class, each node represents position on board - value
    #     #construct from starting position every possible move
        
        # self.root_node.bfs()
        #create node for eahc pos on the board
        #start with root node
        #that nodes child = possible moves
        #next nodes children + new_moves etc
        root_node.value = pos
        root_node.children = KnightPathFinder.valid_moves(pos)


    end

end

test = KnightPathFinder.new([3,3])
p KnightPathFinder.valid_moves([3,3])