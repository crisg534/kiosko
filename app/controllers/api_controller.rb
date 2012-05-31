class ApiController < ApplicationController
  def get_api
    @kiosks = Kiosk.all
    render :json => @kiosks.to_json(:only =>[:id,:nombre,:precio,:create_at,:portada_file_name,:pdf_file_name,:portada_file_size,:pdf_file_size], :methods => [:portada_url,:pdf_url])
  end
  def index

  end
end
