require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'before actions' do

        describe 'set_user' do
            it 'is expected to define befor action' do
                is_expected.to have_before_action(:set_user)
            end
        end

        describe 'require_user' do
            it 'is expected to define before action' do
                is_expected.to have_before_action(:require_user)
            end
        end

        describe 'require_user_logged_in_user' do
            it 'is expected to define before action' do
                is_expected.to have_before_action(:require_logged_in_user)
            end
        end

    end

    describe 'GET #index' do

        before do
            get :index, params: {page:1}
        end

        it 'assigns paginated users to @users instance' do
            users = FactoryBot.create_list(:user, 5)
            expect(assigns(:users)).to eq(User.paginate(page: 1, per_page:2))
        end
    end

    describe 'GET #show' do
        before do
            user = FactoryBot.create(:user)
            @articles = FactoryBot.create_list(:article, 3, user: user)
            get :show, params: { id: user.id }
        end
        
        it 'assigns @articles to corresponding @user instance' do
            expect(assigns(:articles)).to match_array(@articles)
        end
    end

    describe 'GET #new' do
        before do
            get :new
        end

        it 'is expected to assign user a new instance' do
            expect(assigns[:user]).to be_instance_of(User)
        end
    end

    describe "GET #edit" do
        before do
          get :edit, params: params
        end

        context 'when user id is valid' do
            let(:user) { FactoryBot.create :user }
            let(:params) {{ id: user.id }}

            it 'is expected to set user instance' do
                expect(assigns[:user]).to eq(User.find_by(id: params[:id]))
            end
        end

        # context 'when the user id is invalid' do
        #     let(:params) {{ id: Faker::Number.number }}

        #     it 'is expected to redirect to user_path' do
        #         is_expected.to redirect_to(user_path)
        #     end

        #     it 'is expected to display flash message' do
        #         expect(flash[:notice]).to eq('User not found')
        #     end
        # end
    end

    describe "POST #create" do
        before do
            post :create, params:{user: {user: user} } 
        end

        
        context 'when params are valid ' do
            let(:user){ FactoryBot.create :user }

            it 'expects that new user is created successfully' do
                expect(assigns(:user)).to be_instance_of(User)
            end
            
            it 'expects to redirect to user_path' do
                expect(response).to redirect_to(users_path(assigns(:user)))
                # is_expected.to redirect_to users_path
            end

            # it 'expects to set flash message' do
                
            # end
        end
        let(:user){ FactoryBot.create :user }
    end

#     describe 'POST #create' do
        
#         let(:user){ FactoryBot.create :user }

#         before do
#             post :create, params:{user: {user: user} } 
#         end

#         it 'to check the creation of the user' do
#             expect(assigns[:user]).to be_instance_of(User)
#         end
#     end

#     describe 'GET #edit' do
        
#         let(:user) { FactoryBot.create :user }
#         let(:params) {{ id: user.id }}
       
#         before do
#             get :edit, params: params
#         end
    
#         it 'checks for the correct template and fetches the right details' do
#             expect(assigns(:user)).to eq(user)
#         end
#   end

# # describe 'get'
  
end