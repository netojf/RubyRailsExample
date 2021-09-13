class ArticlesController < ApplicationController
    def new
        @article = Article.new
        puts(@article)
    end

    def create
        # byebug
        @article = Article.new(article_params)

        @article.autor = Autor.find params[:article][:autor]
        @article.library = Library.find params[:article][:library]

        respond_to do |format|
            if @article.save
                format.html { redirect_to @article, notice: "Article was successfully created." }
                format.json { render :show, status: :created, location: @article }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end 
        end
    end
    
    def list
        @articles = Article.all
        puts(@articles)
    end

    def delete
        puts('id do artigo para deleção ' + params[:id])
        @articles = Article.find(params[:id])
        unless @articles.nil?
            @articles.destroy
            respond_to do |format|
                format.html { redirect_to articles_list_url, notice: "Article was successfully destroyed." }
                format.json { head :no_content }
              end
        end
    end
    
    def show
        puts(params)
        @article = Article.find(params[:id])
    end 

    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
