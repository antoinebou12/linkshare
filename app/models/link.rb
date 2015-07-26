# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  file        :string(255)
#
# Indexes
#
#  index_links_on_user_id  (user_id)
#

class Link < ActiveRecord::Base
    mount_uploader :file, FileUploader
    acts_as_votable    
    belongs_to :user
    has_many :comments
    is_impressionable
    
    def self.search(search)
        if search
            where(['title LIKE ?', "%#{search}%"])
        else
            all
        end
    end

end
