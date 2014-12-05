# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

	attr_accessible :content, :user_id
	validates :user_id, presence: true

	belongs_to :user
	has_many :comments, dependent: :destroy

	default_scope  { order(created_at: :desc) }

   def self.uncommented
   	joins(:comments).where 'posts.id not in comments.post_id'
   end
end
