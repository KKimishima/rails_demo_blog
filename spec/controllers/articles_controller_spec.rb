require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'get index' do
    context '振る舞い確認' do
      it "httpレスポンスが正常確認" do
        get :index
        expect(response).to have_http_status(200)
      end
      it 'テンプレートが正しい確認' do
        get :index
        expect(response).to render_template :index
      end
    end
    context 'ページパラメータ振る舞い確認' do
      it 'パラメータがない場合' do
        get :index
        @page = '1'
        p response.body
        # expect(response).to
      end
    end

  end
end
