class Log < ActiveRecord::Base
  belongs_to :subtask
  default_scope { order(:stop) }
  validates_presence_of :subtask

  def duration
    ((stop? ? stop.to_time : Time.now) - start.to_time).to_i
  end

end
