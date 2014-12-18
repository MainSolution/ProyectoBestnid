class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates_numericality_of  :precio
  #validates_uniqueness_of :user_id, :message => "Ya has ofertado por este articulo"
end
