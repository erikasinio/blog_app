class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
    end

    def edit
    end

    def new
        @article = Article.new
        @article.title = params[:title]
        @article.body = params[:body]
    end

    def create
        @article = Article.new(article_params)
        if @article.save
          flash[:notice] = "Article was created successful"
          redirect_to @article
        else
          render :new
        end
    end

    def update
         if @article.update(article_params)
            flash[notice] = "Article was updated successfully."
            redirect_to @article
         else
            render 'edit'
         end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
