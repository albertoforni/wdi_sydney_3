class Robotrandom
    # require './lib/classes/robotrandom.rb'
    # x = Robotrandom.new

    attr_accessor mac, name
    
    def initialize(mac=nil, name=nil)
    	@mac = mac;
        @name = name;
    end
        # only use initialise if overwriting the default one
        # we have written so just use getter and setter

    def make_new(mac, name)
        @name ||= prefix + postfix 
        return @name.to_s
        # if name is true (already set) OR (prefix + postfix)
        # same as @name = @name || (prefix + postfix)
        # shorthand for set it unless it's already set
    end

    def prefix
        #random letter generator
  
        ('A'..'Z').to_a.sample(2).join
    end

    def postfix 
        #random number generator

        rand(100...999).to_s
    end

end