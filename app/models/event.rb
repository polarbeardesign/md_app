class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :event_status
  belongs_to :location

  scope :ordered, order("events.start ASC")
  scope :reverse, order("events.start DESC")
  scope :cat_ordered, order("events.event_type_id ASC", "events.start ASC")
  scope :confirmed, where("event_status_id = 1")
  scope :tease, :limit => 3
  scope :published, lambda {
    where ("events.start IS NOT NULL AND events.end > ?"), (Time.zone.now - 2.day)
    }

end
