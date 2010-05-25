class ManyHeaded  
  def self.hydra(n)
    children = {}

    n.times{ |i|
      pid = fork
      return i unless pid
      children[pid] = i
    }

    while true
      pid = Process.wait(-1)

      i = children.delete pid

      if $?.exitstatus != 0
        pid = fork
        return i unless pid  
        children[pid] = i
      end

      if children.empty?
        yield if block_given?
        exit 0 
      end

    end
  end
end
