# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  link_id    :integer
#  body       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_comments_on_link_id  (link_id)
#  index_comments_on_user_id  (user_id)
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  
end
