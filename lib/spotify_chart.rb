require 'json'
require 'open-uri'
require 'pry'

class SpotifyChart

  attr_reader :base_url

  def initialize
    @base_url = "http://charts.spotify.com/api/tracks"
  end

  def get_url(preference, region)
    "#{@base_url}/#{preference}/#{region}/daily/latest"# return a string that is the base url + / + preference + / + region + / + latest
  end

  def get_json(url)
    JSON.load(open(url))
    # load json given a url here
    # refer to the references if you have questions about this
  end

  def fetch_track_album_artist(music_hash)
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }
    
    track_name = music_hash["tracks"][0]["track_name"]
    artist_name = music_hash["tracks"][0]["artist_name"]
    album_name = music_hash["tracks"][0]["album_name"]

    "'#{track_name}' by #{artist_name} from the album #{album_name}"
    
    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array
  end


  def most_streamed(region)
    url = get_url("most_streamed",region)
    hash = get_json(url)
    fetch_track_album_artist(hash)
    # call on get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
  end

  def most_viral(region)
    url = get_url('most_viral',region)
    hash = get_json(url)
    fetch_track_album_artist(hash)
    # call no get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
  end

end
