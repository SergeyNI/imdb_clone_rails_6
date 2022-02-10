require 'rails_helper'
RSpec.describe MoviesController, :type => :controller do
  describe "without signin admin" do
    describe 'redirect to login admin' do
      describe 'index' do
    
        it  do
          get 'index'
          expect(response).to redirect_to('/admin/login')
        end
      
      end

      describe 'create' do
        it  do
          movie = FactoryBot.build(:movie)
          post('create', params: {movie: movie.attributes})
          # byebug
          # expect(response).to have_http_status(:forbidden)
          expect(response).to redirect_to('/admin/login')
        end
        
      end
    end
    
    describe "existing movie" do
      before(:each) do
        @movie = FactoryBot.create(:movie)
      end
      describe 'update' do
        it  do
          put 'update', params: {id: @movie.id, movie: @movie.attributes}
          expect(response).to redirect_to('/admin/login')
        end
        
      end

      describe 'destroy' do
        it  do
          delete 'destroy', params: {id: @movie.id, movie: @movie.attributes}
          expect(response).to redirect_to('/admin/login')
        end        
      end

      describe 'show' do
        it  do
          get 'show', params: {id: @movie.id}
          expect(response).to redirect_to('/admin/login')
        end
        
      end
  
      describe 'edit' do
        it  do
          get 'edit',params: {id: @movie.id}
          expect(response).to redirect_to('/admin/login')
        end
        
      end
      
    end

        
    
  end

  describe "signin admin" do
    login_admin
    describe 'index' do
      it 'render template' do
        get 'index'
        expect(response).to render_template('index')
      end
    end
    
    describe 'create' do
      it  do
        movie = FactoryBot.build(:movie)
        post('create', params: {movie: movie.attributes})
        # byebug
        # expect(response).to have_http_status(:forbidden)
        expect(response).to render_template('new')
      end      
    end
  
    describe "existing movie" do
      before(:each) do
        @movie = FactoryBot.create(:movie)
      end
      describe 'update' do
        it  do
          put 'update', params: {id: @movie.id, movie: @movie.attributes}
          expect(response).to  redirect_to movie_url(@movie)
        end
        
      end

      describe 'destroy' do
        it  do
          delete 'destroy', params: {id: @movie.id, movie: @movie.attributes}
          expect(response).to redirect_to movies_url
        end
      end

      describe 'show' do
        it  do
          get 'show', params: {id: @movie.id}
          expect(response).to render_template('show')
        end
        
      end
  
      describe 'edit' do
        it  do
          get 'edit',params: {id: @movie.id}
          expect(response).to render_template('edit')
        end
        
      end
      
    end
    

  end

end