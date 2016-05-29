require 'rails_helper'

RSpec.describe OfferingsController, type: :controller do
    
    describe 'GET index' do
        it 'sets @offerings' do
            get :index
            expect(assigns :offerings).to_not be_nil
        end
            
        it 'renders the index' do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    describe 'GET enroll' do
        before :each do 
            @c = Course.create(department: "COM", course_number: "1000", title: "Intro") 
            @o = Offering.create(course: @c, semester: 1, location: "Belfer 400",
                section: 321, professor_last_name: "Kelly", spots_available: 10, crn: 5000)
        end
        
        it 'redirects to offerings index' do
            get :enroll, :id => @o.id
            expect(response).to redirect_to offerings_path
        end
        
        it 'decrements the spots available' do
            get :enroll, :id => @o.id
            @o.reload
            expect(@o.spots_available).to eql 9
        end
    end

end
