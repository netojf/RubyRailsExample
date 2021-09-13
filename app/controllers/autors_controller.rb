class AutorsController < ApplicationController

  def index
      @autors = Autor.all
  end

  def new 
    @autor = Autor.new
  end

  def delete
    puts('id do autor para deleção ' + params[:id])
    @deleteAutor = Autor.find(params[:id])
    unless @deleteAutor.nil?
        @deleteAutor.destroy
        respond_to do |format|
            format.html { redirect_to autor_path_url, notice: "Autor was successfully destroyed." }
            format.json { head :no_content }
          end
    end
  end

  def create
    @autor = Autor.new(autor_params)
    respond_to do |format|
      if @autor.save
          format.html { redirect_to @autor, notice: "Autor was successfully created." }
          format.json { render :show, status: :created, location: @autor }
      else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @autor.errors, status: :unprocessable_entity }
      end 
    end
  end

  def show
    puts(params)
    @autor = Autor.find(params[:id])
  end 

  
  private
  def autor_params
      params.require(:autor).permit(:name, :cson)
  end
end
