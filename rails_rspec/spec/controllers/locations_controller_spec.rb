require 'spec_helper'

describe LocationsController do

  describe "#create" do
    subject { post :create, { :location =>
                              { :latitude => 25.0,
                                :longitude => -40.0}}
    }
    its(:status) { should eq 302 } # 302 = redirect
  end

end
