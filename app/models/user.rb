class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks, dependent: :destroy
  # scope :todo_tasks,        -> { includes(:tasks).includes(tasks: :subtasks).where(tasks: {state: "to_do"})}
  scope :with_public_tasks, -> { includes(:tasks).includes(tasks: :subtasks).where(tasks: {public: false})}
  scope :todo_tasks, -> { includes(:tasks).where(tasks: {state: "to_do"})}
  
  # scope :tynewydd_posts, :include => :department, :conditions => {"departments.name" => "Ty Newydd"}.order("posts.created_at DESC")
  
  # scope :adultos, where("idade > 19").order(:nome)
  validates_presence_of :nome, :sobrenome, :celular, :funcacao, :setor, :username
  validates_uniqueness_of :username, :celular
  

  # existing code

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 def work?
    !logs.empty? && !logs.first.stop
  end

end
