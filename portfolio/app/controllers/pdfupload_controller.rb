class PdfuploadController < ApplicationController
    def new
      @pdf = Pdf.new
    end
  
    def create
      @pdf = Pdf.new(upload_params)
      if @pdf.save
        redirect_to uploadedpdfs_path
      end
    end
  
    private def upload_params
      params.require(:pdf).permit(:user_id, :name, :details, :pdf_file)
    end
  end