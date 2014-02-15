class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable

  field :body, type: String
  field :title, type: String
  field :archived, type: Boolean, default: false

  has_many :comments

  validates_presence_of :body, :title

  belongs_to :user

  default_scope ->{ ne(archived: true) }

  def archive!
    update_attribute :archived, true
  end

  def hotness
    value=0 
    value=1 if comments.length>=3 
    return 3+value if Time.now-created_at<24.hours
    return 2+value if Time.now-created_at<72.hours
    return 1+value if Time.now-created_at<7.days
    return 0+value
  end

end
