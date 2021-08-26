require './lib/create.rb'

describe Create do

  let(:form_inputs_fail){ {"name" => "space", "description" => "bla bla1", "price" => "dd", "capacity" => 31, "user_id" => 1} }
  let(:form_inputs_pass){ {"name" => "space", "description" => "bla bla1", "price" => 31, "capacity" => 31, "user_id" => 1} }

  it "#check_params will return false if invalid data is passed with the form" do
    expect(Create.check_params?(form_inputs_fail)).to eq(false)
  end

  it "#check_params will return true if valid data is passed with the form" do
    expect(Create.check_params?(form_inputs_pass)).to eq(true)
  end
  
end
