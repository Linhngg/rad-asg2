class New < ActiveRecord::Base
    belongs_to :user, required: :true
    has_many :comments, -> { order 'created_at desc' }, dependent: :destroy
    
    validates :headline, :presence => true, :length => {:in => 10..200}
    VALID_URL_REGEX = /https?:\/\/[\S]+/
    validates :content, format: { with: VALID_URL_REGEX }, :allow_blank => true
    
    def user_name
        user.username
    end
    
    # def as_json(options={})
    # #   options hash accepts four keys for better customization :only, :methods, :include, :except
    # #   so whenever such keys are found, we call super with those keys to provide response consisting only those keys  
    #   if options.key?(:only) or options.key?(:methods) or options.key?(:include) or options.key?(:except)
    #     h = super(options)
    #   else
    #     h = super(only: [:headline, :content, :created_at], 
    #               methods: [:user_name], )
    #   end  
    # end
    
    def as_json options={}
      {
        title: headline,
        url: content,
        by: user_name,
        type: 'news',
        time: created_at,
        text: '',
      }
    end

end
