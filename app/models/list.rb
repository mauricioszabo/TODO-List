class List < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :user
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  named_scope :find_public_lists, proc { |name|
    {
      :include => :user,
      :conditions => ['lists.name like ? AND lists.public = ?', "%#{name}%", true]
    }
  }

  def visibility
    self.public? ? "Public" : "Private"
  end

  def caption
    "#{user.name}'s \"#{name}\""
  end
end
