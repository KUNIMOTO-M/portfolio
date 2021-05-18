class UploadedpdfsController < ApplicationController
    def index
        @pdfs = current_user.pdfs
    end
end
