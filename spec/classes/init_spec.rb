require 'spec_helper'
describe 's_bitbaker' do
  context 'with default values for all parameters' do
    it { should contain_class('s_bitbaker') }
  end
end
