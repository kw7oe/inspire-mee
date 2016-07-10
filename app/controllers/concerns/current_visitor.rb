module CurrentVisitor
	extend ActiveSupport::Concern

	private
		def set_visitor			
			if session[:visitor].blank?
				 session[:visitor] = SecureRandom.urlsafe_base64
  		end
		end
end