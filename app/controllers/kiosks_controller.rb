class KiosksController < ApplicationController
  #before_filter :authenticate_user!, :only => [:index, :edit, :update, :destroy] 
  # GET /kiosks
  # GET /kiosks.json
  #respond_to :json
  def index
    @kiosks = Kiosk.all
    respond_to do |format|
      format.html
      format.json { render json: KiosksDatatable.new(view_context) }
    end
  end

  # GET /kiosks/1
  # GET /kiosks/1.json
  def show
    @kiosk = Kiosk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kiosk }
    end
  end

  # GET /kiosks/new
  # GET /kiosks/new.json
  def new
    @kiosk = Kiosk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kiosk }
    end
  end

  # GET /kiosks/1/edit
  def edit
    @kiosk = Kiosk.find(params[:id])
  end

  # POST /kiosks
  # POST /kiosks.json
  def create
    @kiosk = Kiosk.new(params[:kiosk])

    respond_to do |format|
      if @kiosk.save
        format.html { redirect_to @kiosk, notice: 'Kiosk was successfully created.' }
        format.json { render json: @kiosk, status: :created, location: @kiosk }
      else
        format.html { render action: "new" }
        format.json { render json: @kiosk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kiosks/1
  # PUT /kiosks/1.json
  def update
    @kiosk = Kiosk.find(params[:id])

    respond_to do |format|
      if @kiosk.update_attributes(params[:kiosk])
        format.html { redirect_to @kiosk, notice: 'Kiosk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kiosk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kiosks/1
  # DELETE /kiosks/1.json
  def destroy
    @kiosk = Kiosk.find(params[:id])
    @kiosk.destroy

    respond_to do |format|
      format.html { redirect_to kiosks_url }
      format.json { head :no_content }
    end


  end
end
