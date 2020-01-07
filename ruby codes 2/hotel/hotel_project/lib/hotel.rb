require_relative "room"

class Hotel
    def initialize(name,hash)
        @name=name
        @hash=hash
        @rooms={}
        hash.each {|room_name,capacity|@rooms[room_name]=Room.new(capacity)}
    end

    def name
        @capitalized_name=@name
        @capitalized_name.split.map{|word|word.capitalize}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
         @rooms.keys.include?(room_name)
    end

    def check_in(person,room_name)
        if self.room_exists?(room_name)
          if @rooms[room_name].add_occupant(person)
            puts "check in successful" 
          else
            puts "sorry,room is full"
          end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        !@rooms.each_value.all?{|instance|instance.full?}
    end

    def list_rooms
        @rooms.each do |name,instance|
            puts name + ":" + instance.available_space.to_s
        end
    end
end
