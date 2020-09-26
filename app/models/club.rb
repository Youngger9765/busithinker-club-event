class Club < ApplicationRecord
    has_many :event_clubships
    has_many :events, :through => :event_clubships

    has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

    has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
end
