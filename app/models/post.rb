class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable

  field :body, type: String
  field :title, type: String
  field :archived, type: Boolean, default: false

<<<<<<< HEAD
  has_many :comments

=======
>>>>>>> e222d25e8246153ff10b6872742a333fe79e55c1
  validates_presence_of :body, :title

  belongs_to :user

  default_scope ->{ ne(archived: true) }

  def archive!
    update_attribute :archived, true
  end

end
