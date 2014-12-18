class TransactionsController < ApplicationController
def new
	@payment=Transaction.new
end

 def create
     @payment=Transaction.create!(params.require(:transaction).permit([:cant, :numCard, :comision, :cantrec, :user_id, :offer_id]))
     o=Offer.find(@payment.offer_id)
     o.estado= "Pagada"
     articulo=Article.find(o.article_id)
     articulo.transaccion="Pagado"
     articulo.save
     o.save
     redirect_to offers_path, :notice => "El pago se realizo satifactoriamente"
  end

def  index
   @transaccion = Transaction.all	
 end   
end
