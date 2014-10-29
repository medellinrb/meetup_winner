require 'meetup_winner/version'
require 'httparty'
require 'cgi'
require 'base64'
require 'open-uri'

class MeetupWinner
  def initialize(key, group_name)
    begin
      group_name  = CGI::escape(group_name)
      @group_info = HTTParty.get("https://api.meetup.com/find/groups?&sign=true&text=#{group_name}&upcoming_events=true&key=#{key}&only=next_event")
      event_id    = @group_info[0]["next_event"]["id"]
      response    = HTTParty.get("https://api.meetup.com/2/rsvps?&sign=true&event_id=#{event_id}&page=500&key=#{key}")
      @attendance = response["results"]
    rescue
      puts "An error has ocurred, check your key and internet connection"
    end
  end

  def choose
    winner_position = rand(0..(count - 1))
    winner = @attendance[winner_position]
    chosen_image(winner["member_photo"])
    puts winner["member"]["name"]
  end

  def count
    @attendance.count
  end

  def attendance
    @attendance.each do |person|
      chosen_image(person["member_photo"])
      puts person["member"]["name"]
    end
    puts @group_info[0]["next_event"]["name"]
    puts "Number of members: #{count}"
  end

  # Based in this script
  # http://ryuutei.github.io/coding/with/haphazardness/2014/08/12/printi.html
  # http://iterm2.com/images.html#/section/home
  def chosen_image(photo)
    if photo
      remote_file = nil
      open(photo["photo_link"]) do |f|
        remote_file = Base64.encode64(f.read)
      end
      puts("\x1b]1337;File=;inline=1:" + remote_file + "\a\n")
    end
  end
end
