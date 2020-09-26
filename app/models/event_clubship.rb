class EventClubship < ApplicationRecord
    belongs_to :event
    belongs_to :club
end
