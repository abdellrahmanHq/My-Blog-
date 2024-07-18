class BlogPost < ApplicationRecord

    has_rich_text :content

    validates :title , presence: true
    validates :content , presence: true
    
    scope :sorted, ->{ order(published_At: :desc,updated_at: :desc) }
    scope :draft, ->{where(published_At: nil)}
    scope :published, ->{where("published_At <=?", Time.current)}
    scope :scheduled, ->{where("published_At > ?", Time.current)}

    def draft?
        published_At.nil?
      end
    
      def published?
        published_At? && published_At <= Time.current
      end
    
      def scheduled?
        published_At? && published_At > Time.current
      end

end

