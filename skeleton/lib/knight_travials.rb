class KnightPathFinder
    attr_reader :pos
    attr_accessor :root_node

    
    def self.valid_moves(pos)
        possible_moves = []
        possible_moves << [pos[0] + 2, pos[1] + 1] 
        possible_movies << [pos[0] + 1, pos[1] + 2]
        possible_moves 


        #give pos on board
        #return array of all legal chess moves
        #L in any direction #up to 8 but less if you're on edge of board
    end 
    
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        
        build_move_tree
    end

    def new_move_positions
        #filter down valid_moves and exclude places we've been before
        #keeping track of places we've visited
        #use in build move tree
        #instance variable 
    end 

    def build_move_tree
        # self.root_node = PolyTreeNode.new(pos)
        #use node class, each node represents position on board - value
        #construct from starting position every possible move
    end

end