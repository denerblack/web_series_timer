class Serie
  require 'series_timer'
  require 'episode'

  attr_accessor :all_episodes
  attr_accessor :next_episode
  attr_accessor :last_episode

  def initialize
    @all_episodes = [] 
  end
  
  def find_episodes(name,option = "")
    parse_all SeriesTimer::SeriesManager.all_episodes(name.cap_words,option)
    @next_episode = Episode.new to_array(SeriesTimer::SeriesManager.next_episode(name.cap_words,option))
    @last_episode = Episode.new to_array(SeriesTimer::SeriesManager.last_episode(name.cap_words,option))
  end

  def to_api
    result = {
      next_episode: @next_episode,
      last_episode: @last_episode,
      all_episodes: @all_episodes
    }
    
  end

  private

  def parse_all(array_of_full_description)
    array_of_full_description.each do |full_description|
       episode = Episode.new to_array(full_description)
       @all_episodes << episode
    end 
    
  end

  #[Chuck] S01E01\t Chuck Versus the Intersect\t 2007-09-24 (1872 days ago)
  #["[Chuck] S01E02"," Chuck Versus the Helicopter"," 2007-10-01 (1865 days ago)"]
  def to_array(full_description)
    formatted_array = []
    unless full_description.nil?
      split_up = full_description.split(/[\t]/)
      serie, season_episode = split_up[0].split(/\[(.*?)\]/)[1..2]
      season, episode = season_episode.split(/[A-Za-z]/)[1..2]
      name = split_up[1].strip
      date_ep = split_up[2][0..10].strip

      formatted_array << serie << season << episode << name << date_ep
    end 

    formatted_array


  end
  
end
