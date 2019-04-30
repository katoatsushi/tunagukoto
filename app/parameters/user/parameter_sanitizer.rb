class User::ParameterSanitizer < Devise::ParameterSanitizer	  
	def initialize(*)
		super
        # 新規登録時のパラメーター
		permit(:sign_up, keys: [:first_name_kanji, :given_name_kanji, :first_name_kana, :given_name_kana])   
        # ユーザー情報アップデート時のパラメーター
        #permit(:sign_in, keys: [:first_name, :given_name, :phone_number_first, :phone_number_second , :phone_number_last])  
        permit(:account_update, keys: [:sex, :birth_of_date, :portfolio, :introduction, :university_id])  
	end
end