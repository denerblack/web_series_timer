class Episode

  attr_accessor :name
  attr_accessor :season
  attr_accessor :episode
  attr_accessor :serie
  attr_accessor :date_ep


  def initialize(args)
    unless args.empty?
      @serie = args[0]
      @season = args[1]
      @episode = args[2]
      @name = args[3]
      @date_ep = args[4]
    end
  end
  
end
