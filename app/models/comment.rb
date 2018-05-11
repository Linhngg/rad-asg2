class Comment < ActiveRecord::Base
    belongs_to :user, required: :true
    belongs_to :new, required: :true
    
    validates :content, :presence => true, :length => {:in => 5..200}
end
