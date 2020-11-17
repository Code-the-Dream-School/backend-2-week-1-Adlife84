class PagesController < ApplicationController
    def index
        @pages = Page.all
    end

    def show
        @page = Page.find(params[:id])
        # render plain: @page.title //if you don't use render in the block Rails lookink template in view/pages.show.html.erb
    end

    def new
        @page = Page.new
    end

    def create
        page_params = params.require(:page).permit(:title, :body, :slug)
        @page = Page.new(page_params)
        @page.save
        redirect_to @page
        
        #render plain: params.class
        # render plain: params.to_json # this is showing object that we have in params object from our submitted Form
    end

    def edit
        @page = Page.find(params[:id])
    end
end
