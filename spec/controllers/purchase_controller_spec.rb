require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  # let(:user) { create(:user) }
  # let(:product) { create(:product)}
  describe "POST #confirm" do
    it "returns http success" do
      current_user = build(:user)
      post :confirm
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #done" do
    it "returns http success" do
      get :done
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'POST #confirm' do
  #   let(params) {{ user_id: user.id, product_id: product.id}}
  #   it "renders the :confirm template" do
  #     post :confirm
  #     expect(response).to render_template :confirm
  #   end

  # end

  # describe 'POST #pay' do
  #   context 'バイヤーidがnillの場合' do
  #     it 'カード決済ができる'
  #     it 'バイヤーidを付与する'
  #     it ':doneアクションの呼び出し'
  #   end
  #   context 'バイヤーidがfolseの場合' do
  #     it 'toppageへ遷移'
  #   end
  # end

  # describe 'GET #done' do
  #   it 'doneテンプレート呼び出し'
  # end

end