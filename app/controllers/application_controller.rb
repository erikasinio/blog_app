class ApplicationController < ActionController::Base

    # def hello
    #   render html:'Hello World!'
    # end

    # def index
    #     @articles = Article.all
    #   end
    #   def show
    #     @article = Article.find(params[:id])
    #     @comments = @article.comments
    #   end
      def new
        @article = Article.new
        @article.title = params[:title]
        @article.body = params[:body]
      end

      def create
        @article = Article.new(article_params)
        if @article.save
          redirect_to articles_path
        else
          render :new
        end
      end
      
      private
      def article_params
        params.require(:article).permit(:title, :body)
      end
end
