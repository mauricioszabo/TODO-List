class List < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :user
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  def visibility
    self.public? ? "Public" : "Private"
  end
end
