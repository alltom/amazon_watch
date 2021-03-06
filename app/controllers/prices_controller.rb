class PricesController < ApplicationController
  def index
    @prices = Price.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prices }
    end
  end

  def show
    @price = Price.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price }
    end
  end

  def new
    @price = Price.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price }
    end
  end

  def edit
    @price = Price.find(params[:id])
  end

  def create
    @price = Price.new(params[:price])

    respond_to do |format|
      if @price.save
        flash[:notice] = 'Price was successfully created.'
        format.html { redirect_to(@price) }
        format.xml  { render :xml => @price, :status => :created, :location => @price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @price = Price.find(params[:id])

    respond_to do |format|
      if @price.update_attributes(params[:price])
        flash[:notice] = 'Price was successfully updated.'
        format.html { redirect_to(@price) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def batch_edit
    @text = ""
  end
  
  def batch_update
    if @batch_updated = Price.batch_update(request[:prices])
      flash[:notice] = "updated prices for: #{@batch_updated.map(&:name).join(", ")}"
      redirect_to products_url
    else
      flash[:error] = "couldn't save"
      @text = request[:prices]
      render :action => :batch_edit
    end
  end

  def destroy
    @price = Price.find(params[:id])
    @price.destroy

    respond_to do |format|
      format.html { redirect_to(prices_url) }
      format.xml  { head :ok }
    end
  end
end
