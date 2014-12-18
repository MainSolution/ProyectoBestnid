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
	@est.fechaf=@est.fechaf + 1.days
	if @est.tipo == 'Usuario con mas ventas'
	    @ofertas = Article.where("created_at <= ?  and  created_at >= ? and transaccion = ? ", @est.fechaf,@est.fechai,"Pagado" ).group('user_id').order('count_id desc').count('id')
    elsif @est.tipo == 'Usuario con mas articulos'
    	@ofertas = Article.where("created_at <= ?  and  created_at >= ? ", @est.fechaf,@est.fechai).group('user_id').order('count_id desc').count('id')	
	elsif @est.tipo == 'Usuario con mas compras'
		@ofertas=Transaction.where("created_at <= ?  and  created_at >= ? ", @est.fechaf,@est.fechai).group('user_id').order('count_id desc').count('id')
	end
	if @ofertas.size != 0
		offerarray=@ofertas.to_a	
		
		@est.username= Array.new(offerarray.size)

		@est.cant= Array.new(offerarray.size)
		i=0
	offerarray.each do |o|
	   id=o[0]
	   cantidad=o[1]
	   @est.username[i]=User.find(id).nombre
	   @est.cant[i]=cantidad
	   i=i+1
	end
	end
	@est.save
end

end	