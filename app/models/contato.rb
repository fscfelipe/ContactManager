require 'aws-sdk'

class Contato < ActiveRecord::Base
	belongs_to :user

  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

# This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar,styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, default_url: "/avatars/:style/missing.png",
     :storage => :s3,
      url: ':s3_domain_url',
      path: '/:class/:attachment/:id_partition/:style/:filename',
     :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => ENV.fetch('S3_BUCKET_NAME'),
     s3_protocol: 'http', 
     :access_key_id => ENV.fetch('AWS_ACCESS_KEY_ID'), 
     :secret_access_key => ENV.fetch('AWS_SECRET_ACCESS_KEY'),
     :s3_region => ENV.fetch('AWS_REGION')}
  end

  def self.search(term)
    if term
      where('nome LIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC') 
    end
  end
  # Validate the attached image is image/jpg, image/png, etc
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
 #:path => ":rails_root/public/:attachment/:style/:filename",
 #:url => "/:attachment/:style/:filename",
end
