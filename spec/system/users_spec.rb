require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context '正しく新規登録できる' do
    it "正しい入力ができれば、新規登録ができ、トップページに戻る"　do
      visit root_path
      expect(page).to have_content('新規登録')
      
    end
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
