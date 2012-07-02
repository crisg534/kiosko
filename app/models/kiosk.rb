class Kiosk < ActiveRecord::Base
  has_attached_file :portada,
                    :storage => :Dropboxstorage,
                    :path => "/:attachment/:attachment/:id/:style/:filename"
  has_attached_file :pdf,
                    :storage => :Dropboxstorage,
                    :path => "/:attachment/:attachment/:id/:style/:filename"
  attr_accessible :image, :nombre, :precio,:portada,:pdf,:descripcion
  validates_attachment_content_type :portada ,content_type: ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_content_type :pdf ,content_type: ["application/pdf", "application/x-pdf"]
	
	def portada_url
       self.portada.url
	end
	
	def pdf_url
       self.pdf.url
	end
	
  #api
 # acts_as_api
  #api_accessible :kiosk do |template|
   # template.add :nombre
    #template.add :precio
    #template.add :descripcion
    #template.add :create_at
    #template.add :portada_url
    #template.add :pdf_url
    
  #end
  
end
