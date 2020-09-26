class Event < ApplicationRecord
    has_many :event_clubships
    has_many :clubs, :through => :event_clubships 
end
