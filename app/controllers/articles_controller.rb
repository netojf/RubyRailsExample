class ArticlesController < ApplicationController
    def new
    end
    
    def list
        @articles = Article.all
    end

    def delete
    end

    def view
    end 
    
end
