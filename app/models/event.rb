class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    validates :title, :description, :date_time, :location, presence: true
    has_many :invitation, foreign_key: :attended_event_id
    has_many :attendees, through: :invitation

    scope :past, -> { where('date_time < ?', Date.today).order(date_time: :desc) }
    scope :future, -> { where('date_time > ?', Date.today).order(:date_time) }
end
