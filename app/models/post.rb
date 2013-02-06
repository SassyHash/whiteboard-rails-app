class Post <ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :title, :body, :created_at, :updated_at

  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 1, maximum: 50}
  validates :body, presence: true, length: {minimum: 3}


  def title_url
    self.title.downcase
  end

end