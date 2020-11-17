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
end
