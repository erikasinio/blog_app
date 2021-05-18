class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
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

    private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
