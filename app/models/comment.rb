class Comment < ActiveRecord::Base
    belongs_to :user, required: :true
    belongs_to :new, required: :true
    
    validates :content, :presence => true, :length => {:in => 3..1000}
    
    def user_name
        user.username
    end
    
    def as_json options={}
      {
        id: id,
        text: content,
        by: user_name,
        type: 'comments',
        time: created_at,
      }
    end
end
