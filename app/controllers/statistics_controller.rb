class StatisticsController < ApplicationController
def new
	@estadistica = Statistic.new
end

def index
	@est = Statistic.all
end

def create
	@estadistica = Statistic.create!(params.require(:statistic).permit([:tipo,:fechai,:fechaf]))
    redirect_to @estadistica, :notice => "estadistica creada exitosamente"
end

def show
	@est = Statistic.find(params[:id])
	if @est.tipo == 'Usuario con mas ventas'
	    @ofertas = Offer.where("created_at <= ?  and  created_at >= ? and estado = ? ", @est.fechaf,@est.fechai,"pagada" ).group('user_id').order('count_id desc').count('id')
    elsif @est.tipo == 'Usuario con mas articulos'
    	@ofertas = Article.where("created_at <= ?  and  created_at >= ? ", @est.fechaf,@est.fechai).group('user_id').order('count_id desc').count('id')	
	elsif @est.tipo == 'Usuario con mas compras'
		@ofertas=Transaction.where("created_at <= ?  and  created_at >= ? ", @est.fechaf,@est.fechai).group('user_id').order('count_id desc').count('id')
	end
end

end	