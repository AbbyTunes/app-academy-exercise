require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    subject(:user) do
        User.create!(
        username: "name_3",
        password: "hunter_3")
    end

    describe "GET #show" do
        it "renders the show template" do
            get :show, params: { id: user.id }
            expect(response).to render_template(:show)
        end
    end

    describe "POST #new" do
        it "renders the new template" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do

        subject(:user) do
            User.create!(
            username: "name_3",
            password: "hunter_3")
        end

        context "invalid params" do
            it "if password incorrect (doesn't match)" do
                post :create, params: {
                    user: {username: "name_3", password: "hunter_1"}
                }
                # save_and_open_page
                expect(response).to render_template(:new)
                # save_and_open_page
                # expect(flash[:errors]).to be_present
            end

            it "if password shorter than 6 characters" do
                post :create, params: {
                    user: {username: "name_3", password: "1234"}
                }
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end

        context "valid params" do
            it "goes to #show page" do
                post :create, params: { 
                    user: {username: "name_3", password: "hunter_3"}
                }
                expect(response).to redirect_to(user_url(User.find_by(username: "name_3").id))
            end 
        end
    end

end


# expect(response).to redirect_to(user_url(User.last))


    # describe "GET #index" do
    #     it "renders the index template" do
    #         get :index
    #         expect(response).to render_template(:index)
    #     end
    # end


