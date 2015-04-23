class RegistrationsController < Devise::RegistrationsController


private

	def sign_up_params
		params.require(:user).permit(:email,:password,:password_confirmation, :nome, :sobrenome, :celular, :funcacao, :setor, :avatar, :username )
	end

	def account_update_params
		params.require(:user).permit(:email,:username, :nome,:password,:password_confirmation, :current_password, :sobrenome, :apelido,:bio,:celular,:funcacao,:formacao,:datanascimento,:facebook,:twitter,:linkedin,:whatsapp,:setor, :ramal, :avatar)
	end
end
















