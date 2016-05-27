class OfferingsController < ApplicationController
  before_action :set_offering, only: [:show, :edit, :update, :destroy, :enroll]

  # GET /offerings
  # GET /offerings.json
  def index
    @offerings = Offering.search(params)
    respond_to do |format|
      format.html
      format.json {render :json => @offerings.to_json}
      format.xml {render :xml => @offerings.to_xml}
    end
  end
  
  def search
  end

  # GET /offerings/1
  # GET /offerings/1.json
  def show
    respond_to do |format|
      format.html
      format.json {render :json => @offering.to_json}
      format.xml {render :xml => @offering.to_xml}
    end
  end
  
  def enroll
    if (@offering.enroll) then
      flash[:notice] = "You have been enrolled in #{@offering.course.title}."
    else
      flash[:alert] = "#{@offering.course.title} is already full."
    end
    redirect_to action: 'search'
  end

  # GET /offerings/new
  def new
    @offering = Offering.new
  end

  # GET /offerings/1/edit
  def edit
  end

  # POST /offerings
  # POST /offerings.json
  def create
    @offering = Offering.new(offering_params)

    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: 'Offering was successfully created.' }
        format.json { render :show, status: :created, location: @offering }
      else
        format.html { render :new }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offerings/1
  # PATCH/PUT /offerings/1.json
  def update
    respond_to do |format|
      if @offering.update(offering_params)
        format.html { redirect_to @offering, notice: 'Offering was successfully updated.' }
        format.json { render :show, status: :ok, location: @offering }
      else
        format.html { render :edit }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1
  # DELETE /offerings/1.json
  def destroy
    @offering.destroy
    respond_to do |format|
      format.html { redirect_to offerings_url, notice: 'Offering was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offering
      @offering = Offering.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offering_params
      params.fetch(:offering, {})
    end
end
