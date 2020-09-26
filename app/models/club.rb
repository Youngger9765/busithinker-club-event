class Club < ApplicationRecord
    has_many :event_clubships
    has_many :events, :through => :event_clubships
end
