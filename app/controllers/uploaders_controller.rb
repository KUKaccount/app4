class UploadersController < ApplicationController
    def new
        @uploader = Uploader.new
    end
    
    def create
        @uploader = Uploader.create params.require(:uploader).permit(:content, :image) # POINT
        redirect_to @uploader
    end
    
    def show
        @uploader = Uploader.find(params[:id])
    end
    
    def edit
        @uploader = Uploader.find(params[:id]) 
    end
    
    def update
        @uploader = Article.find(params[:id])
        if @uploader.update(article_params)
            redirect_to @uploader
        else
            render 'edit'
        end
    end
end
