class ArticlesController < ApplicationController
    def new
        @article = Article.new
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
    
end
