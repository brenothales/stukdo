class Task < ActiveRecord::Base
	

	belongs_to :user

	has_many :subtasks, :dependent => :destroy
	has_many :logs, through: :subtasks
	
	validates :content, presence: { message: 'Please provide a name' }

	validates :user_id, presence: true

	default_scope { order("priority ASC") }
	scope :public_tasks, -> { where(public: false)}


	auto_html_for :content do
		html_escape
		image
		youtube(:width => "100%", :height => 250, :autoplay => false)
		link :target => "_blank", :rel => "nofollow"
		simple_format	
	end 

	def logged
	  logs.map(&:duration).sum
	end

end
