class Kiosk < ActiveRecord::Base
  has_attached_file :portada ,:url => "/portadas/:id/:basename.:extension",:path => ":rails_root/public/portadas/:id/:basename.:extension"
  has_attached_file :pdf #,:url => "/:class/:attachment/:id/:style/:basename.:extension"
  attr_accessible :image, :nombre, :precio,:portada,:pdf
  validates_attachment_content_type :portada ,content_type: ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_content_type :pdf ,content_type: ["application/pdf", "application/x-pdf"]
	
	def portada_url
       self.portada.url(:medium)
	end
	def pdf_url
       self.pdf.url
	end

end
