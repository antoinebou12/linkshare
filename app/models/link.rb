# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Link < ActiveRecord::Base
    acts_as_votable    
    belongs_to :user
    has_many :comments
    is_impressionable
end
