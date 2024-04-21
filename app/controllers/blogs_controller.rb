class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end
    def show
        @blog = Blog.find(params[:id])
    end
    def edit
        @blog = Blog.find(params[:id])
    end
    def update
        @blog = Blog.find(params[:id])
        if @blog = Blog.update(blog_params)
            redirect_to blog_path
        else
            render 'edit'
        end
    end

    private
    def blog_params
        params.require(:blog).permit(:name, :title, :body)
    end
end
