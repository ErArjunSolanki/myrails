class Post < ActiveRecord::Base
	
  # has_many :comments
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  # default_scope {where(publish: true)}
  scope :active, -> {where(publish: true)}
  scope :latest, -> { order("id DESC").limit(5)}

  validates :title, :content, presence: true
  validates :publish, :inclusion => { :in => [true, false]}


  def should_generate_new_friendly_id?
    title_changed?
  end

  # def comments_count
    # comments.count
  # end
	
end
