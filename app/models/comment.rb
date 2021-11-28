class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    unless user_attributes[:username] == ''
      user_attributes.values.each do |user_attribute|
        user = User.find_or_create_by(username: user_attribute)
        user.comments << self
      end
    end
  end

end
