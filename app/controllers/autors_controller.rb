class AutorsController < ApplicationController

    def index
        @autors = Autor.all
      end
end
