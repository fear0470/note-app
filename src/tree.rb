class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end

end



class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end


  def first_search(target)
    puts @payload
    if @payload == target
      return self
    end

    @children.each do |child|
      x =  child.first_search(target)
      return x if x 
    end
    return nil
  end

  def breadth_search(target)
    q = MyQueue.new()
    q.enqueue(self)
    while n = q.dequeue do 
      puts n.payload
      if n.payload == target
        return n
      end
      n.children.each do |child|
        q.enqueue(child)
      end
    end
    return nil

  end

end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

puts trunk.first_search(11).payload
puts 
puts trunk.breadth_search(11).payload