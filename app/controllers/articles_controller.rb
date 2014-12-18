class ArticlesController < ApplicationController
  before_action :get_article, only: [:show,:edit,:destroy,:update]

  def get_article
    @articulo = Article.find(params[:id])
  end
  
  def home
    @articulos = Article.all
  end
  def userarticles
    @articulos = Article.where(user_id: current_user.id)
  end
  def new
    @articulo = Article.new
  end

  def index
    @articulos = Article.search(params[:search])
  end

  def update
    @articulo.update(article_params)
    if @articulo.save
      redirect_to @articulo, :notice => "Articulo editado exitosamente"
    else
      redirect_to :back, :notice => "Error al editar articulo"
    end
  end

  def show
    @comentario = Comment.new
  end


   def choose
    @articulo = Article.find(params[:id])
    @subastador = User.find(@articulo.user_id)
    @ganador = User.find(params[:format])
    @articulo.estado = true
    @articulo.winner_id = @ganador.id
    @articulo.save
    op = Offer.where(article_id: @articulo.id)
    op.each do |o|
      o.estado = "perdedora"
      o.save
      end
    og = Offer.where(article_id: @articulo.id,user_id: @ganador.id )
    og.each do |o|
      op = o
      end
    op.estado = "ganadora"
    op.save  
    redirect_to :back
  end 




  def winner
    @oferta = Offer.find(params[:id])
    @articulo = Article.find(@oferta.article_id)
     @subastador = User.find(@articulo.user_id)
     @ganador = User.find(@articulo.winner_id)
     
  end

  def edit
  end

  def create
    @articulo = Article.create!(article_params)
    @articulo.user_id = current_user.id
    @articulo.save    
    if @articulo.save
      redirect_to articles_path, :notice => "Articulo creado exitosamente"
    else
      redirect_to :back, :notice => "Error al crear articulo"
    end
  end

  def destroy
    @articulo.destroy
    redirect_to :back 
  end


  private
  
  def article_params 
     params.require(:article).permit([:descripcion,:nombre,:duracion,:estado,:foto,:user_id,:category_id,:transaccion]) 
  end
end
