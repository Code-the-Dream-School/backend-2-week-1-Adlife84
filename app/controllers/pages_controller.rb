class PagesController < ApplicationController
    # before_action :set_page, except: [:index, :new, :create]
    before_action :set_page, only: [:show, :edit, :update, :destroy] #this is better way to maintence this rule

    def index
        @pages = Page.all
    end

    def show
        # @page = Page.find(params[:id])
        # render plain: @page.title //if you don't use render in the block Rails lookink template in view/pages.show.html.erb
    end

    def new
        @page = Page.new
    end

    def create
        @page = Page.new(page_params)
        @page.save
        redirect_to @page
        
        #render plain: params.class
        # render plain: params.to_json # this is showing object that we have in params object from our submitted Form
    end

    def edit
        # @page = Page.find(params[:id])
    end

    def update
        # @page = Page.find(params[:id])
        @page.update(page_params)
        redirect_to @page
    end

    def destroy
        # @page = Page.find(params[:id])
        @page.destroy
        redirect_to pages_path
    end

    private

    def page_params
        page_params = params.require(:page).permit(:title, :body, :slug)
    end

    def set_page
        @page = Page.find(params[:id])
    end

end
