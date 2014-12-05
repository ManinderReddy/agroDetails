# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base

	attr_accessible :content, :post_id, :user_id
	validates :content, presence: true

	belongs_to :post, counter_cache: true
	belongs_to :user

	default_scope  { order(created_at: :desc) }
end
