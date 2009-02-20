class Picture < ActiveRecord::Base
  belongs_to :account
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 2.megabytes,
                 :resize_to => '640x400>',
                 :thumbnails => { :thumb => '100x100>' }

  validates_as_attachment
  
end