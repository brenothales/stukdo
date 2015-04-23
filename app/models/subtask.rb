class Subtask < ActiveRecord::Base
  belongs_to :task
  has_many :logs, dependent: :destroy

  validates_presence_of :task
	default_scope  { order(:created_at => :desc) }
  def work?
    !logs.empty? && !logs.first.stop
  end

  def logged
    logs.map(&:duration).sum
  end
end
