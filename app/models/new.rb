class New < ActiveRecord::Base
    belongs_to :user, required: :true
    has_many :comments, -> { order 'created_at desc' }, dependent: :destroy
    
    validates :headline, :presence => true, :length => {:in => 10..200}
    VALID_URL_REGEX = /https?:\/\/[\S]+/
    validates :content, format: { with: VALID_URL_REGEX }, :allow_blank => true
    
    def user_name
        user.username
    end
    
    def as_json options={}
      {
        id: id,
        title: headline,
        url: content,
        by: user_name,
        type: 'news',
        time: created_at,
        text: '',
      }
    end

end
