class PdfFilesController < ApplicationController
  # GET /pdf_files
  # GET /pdf_files.json
  def index
    @pdf_files = PdfFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pdf_files }
    end
  end

  # GET /pdf_files/1
  # GET /pdf_files/1.json
  def show
    @pdf_file = PdfFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @pdf_file }
    end
  end

  # GET /pdf_files/new
  # GET /pdf_files/new.json
  def new
    @pdf_file = PdfFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @pdf_file }
    end
  end

  # GET /pdf_files/1/edit
  def edit
    @pdf_file = PdfFile.find(params[:id])
  end

  # POST /pdf_files
  # POST /pdf_files.json
  def create
    @pdf_file = PdfFile.new(params[:pdf_file])

    respond_to do |format|
      if @pdf_file.save
        format.html { redirect_to @pdf_file, :notice => 'Pdf file was successfully created.' }
        format.json { render :json => @pdf_file, :status => :created, :location => @pdf_file }
      else
        format.html { render :action => "new" }
        format.json { render :json => @pdf_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pdf_files/1
  # PUT /pdf_files/1.json
  def update
    @pdf_file = PdfFile.find(params[:id])

    respond_to do |format|
      if @pdf_file.update_attributes(params[:pdf_file])
        format.html { redirect_to @pdf_file, :notice => 'Pdf file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @pdf_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_files/1
  # DELETE /pdf_files/1.json
  def destroy
    @pdf_file = PdfFile.find(params[:id])
    @pdf_file.destroy

    respond_to do |format|
      format.html { redirect_to pdf_files_url }
      format.json { head :ok }
    end
  end
end
