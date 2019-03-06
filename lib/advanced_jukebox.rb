#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
"Go Go GO" => 'C:/Users/Crash/.atom/.learn-ide/home/fair-port-4733/jukebox-cli-online-web-prework/audio/Emerald-Park/01.mp3',
"LiberTeens" => 'C:/Users/Crash/.atom/.learn-ide/home/fair-port-4733/jukebox-cli-online-web-prework/audio/Emerald-Park/02.mp3',
"Hamburg" =>  'C:/Users/Crash/.atom/.learn-ide/home/fair-port-4733/jukebox-cli-online-web-prework/audio/Emerald-Park/03.mp3',
"Guiding Light" => 'C:/Users/Crash/.atom/.learn-ide/home/fair-port-4733/jukebox-cli-online-web-prework/audio/Emerald-Park/04.mp3',
"Wolf" => 'C:/Users/Crash/.atom/.learn-ide/home/fair-port-4733/jukebox-cli-online-web-prework/audio/Emerald-Park/05.mp3',
"Blue" => 'C:/Users/Crash/.atom/.learn-ide/home/fair-port-4733/jukebox-cli-online-web-prework/audio/Emerald-Park/06.mp3',
"Graduation Failed" => 'C:/Users/Crash/.atom/.learn-ide/home/fair-port-4733/jukebox-cli-online-web-prework/audio/Emerald-Park/07.mp3'
}

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  songs = my_songs.keys
  songs.each_with_index do |song,index|
    puts "#{index + 1}. #{song}"
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name or number:"
  users_response = gets.chomp
  if my_songs.has_key?(users_response)
    puts "Playing #{users_response}"
    #puts "#{my_songs[users_response]}"
    system "open #{my_songs[users_response]}"

  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  loop do
    puts "Please enter a command:"
    users_response = gets.chomp
    case users_response
    when "play"
      play(songs)
    when "help"
      help
    when "list"
      list(songs)
    when "exit"
      exit_jukebox
      break
    else
      puts "Invalid command"
    end
  end
end
