class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # GET /comentarios
  # GET /comentarios.json
  def index
    @post = Post.find(params[:post_id])
    @comentarios = @post.comentarios

  end



  # GET /comentarios/new
  def new
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.new
  end

  

  # POST /comentarios
  # POST /comentarios.json
  def create
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.new(comentario_params)

    
      if @comentario.save
        @post01 = Post.find(@comentario.post_id)
        redirect_to post_comentarios_path(@post), notice: 'Comentário gravado com sucesso!'
      else
        render :new
      end
    
  end

  # PATCDELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
        @post01 = Post.find(@comentario.post_id)
        format.html { redirect_to @post01, notice: 'Comentario foi removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:nome, :comentario, :post_id)
    end
end
